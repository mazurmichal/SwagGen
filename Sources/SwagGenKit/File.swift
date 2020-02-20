//
//  File.swift
//  
//
//  Created by Michal Mazur (MMU) on 20/02/2020.
//

import Foundation
import Swagger

public class KotlinFormatter : CodeFormatter {

    var disallowedKeywords: [String] {
        return [
            "class",
            "interface",
            "enum",
            "return",
            "throw",
            "throws",
            "public",
            "open",
            "private",
            "internal",
            "val",
            "var",
            "where",
            "fun",
            "import",
            "const",
            "in",
            "out",
            "case",
            "break",
            "continue",
            "do",
            "else",
            "for",
            "if",
            "in",
            "repeat",
            "switch",
            "where",
            "while",
            "as",
            "Any",
            "catch",
            "false",
            "true",
            "is",
            "null",
            "super",
            "this",
        ]
    }

    var inbuiltTypes: [String] = [
        "Throwable",
    ]

    override var disallowedNames: [String] { return disallowedKeywords + inbuiltTypes }
    override var disallowedTypes: [String] { return disallowedKeywords + inbuiltTypes }

    let fixedWidthIntegers: Bool

    public override init(spec: SwaggerSpec, templateConfig: TemplateConfig) {
        fixedWidthIntegers = templateConfig.getBooleanOption("fixedWidthIntegers") ?? false
        super.init(spec: spec, templateConfig: templateConfig)
    }

    override func getSchemaType(name: String, schema: Schema, checkEnum: Bool = true) -> String {

        var enumValue: String?
        if checkEnum {
            enumValue = schema.getEnum(name: name, description: "").flatMap { getEnumContext($0)["enumName"] as? String }
        }

        if schema.canBeEnum, let enumValue = enumValue {
            return enumValue
        }

        switch schema.type {
        case .boolean:
            return "Boolean"
        case let .string(item):
            guard let format = item.format else {
                return "String"
            }
            switch format {
            case let .format(format):
                switch format {
                case .binary: return "File"
                case .byte: return "File"
                case .base64: return "String"
                case .dateTime: return "LocalDateTime"
                case .date: return "LocalDate"
                case .email, .hostname, .ipv4, .ipv6, .password: return "String"
                case .uri: return "URL"
                case .uuid: return "java.util.UUID"
                }
            case .other: return "String"
            }
        case let .number(item):
            guard let format = item.format else {
                return "Double"
            }
            switch format {
            case .double: return "Double"
            case .float: return "Float"
            }
        case let .integer(item):
            guard let format = item.format else {
                return "Int"
            }

            if fixedWidthIntegers {
                switch format {
                case .int32: return "Int"
                case .int64: return "Int"
                }
            } else {
                return "Int"
            }
        case let .array(arraySchema):
            switch arraySchema.items {
            case let .single(type):
                let typeString = getSchemaType(name: name, schema: type, checkEnum: checkEnum)
                return checkEnum ? "List<\(enumValue ?? typeString)>" : typeString
            case let .multiple(types):
                let typeString = getSchemaType(name: name, schema: types.first!, checkEnum: checkEnum)
                return checkEnum ? "List<\(enumValue ?? typeString)>" : typeString
            }
        case let .object(schema):
            if let additionalProperties = schema.additionalProperties {
                let typeString = getSchemaType(name: name, schema: additionalProperties, checkEnum: checkEnum)
                return checkEnum ? "Map<String, \(enumValue ?? typeString)>" : typeString
            } else if schema.properties.isEmpty {
                return "Map<String: Any>"
            } else {
                return escapeType(name.upperCamelCased())
            }
        case let .reference(reference):
            return getSchemaTypeName(reference.component)
        case .group:
            return escapeType(name.upperCamelCased())
        case .any:
            return "Any"
        }
    }

    override func getSchemaContext(_ schema: Schema) -> Context {
        var context = super.getSchemaContext(schema)

        if let objectSchema = schema.type.object,
            let additionalProperties = objectSchema.additionalProperties {
            context["additionalPropertiesType"] = getSchemaType(name: "Anonymous", schema: additionalProperties)
        }

        return context
    }

    override func getParameterContext(_ parameter: Parameter) -> Context {
        var context = super.getParameterContext(parameter)

        let type = context["type"] as! String
        let name = context["name"] as! String

        context["optionalType"] = type + (parameter.required ? "" : "?")
        var encodedValue = getEncodedValue(name: getName(name), type: type)

        if case let .schema(schema) = parameter.type,
            case .array = schema.schema.type,
            let collectionFormat = schema.collectionFormat {
            if type != "List<String>" {
                encodedValue += ".map { x -> x.toString() }"
            }
            encodedValue += ".joinToString(separator: \"\(collectionFormat.separator)\")"
        }
        if !parameter.required, let range = encodedValue.range(of: ".") {
            encodedValue = encodedValue.replacingOccurrences(of: ".", with: "?.", options: [], range: range)
        }
        context["encodedValue"] = encodedValue
        context["isAnyType"] = type.contains("Any")
        return context
    }

    override func getRequestBodyContext(_ requestBody: PossibleReference<RequestBody>) -> Context {
        var context = super.getRequestBodyContext(requestBody)
        let type = context["type"] as! String
        context["optionalType"] = type + (requestBody.value.required ? "" : "?")
        return context
    }

    func getEncodedValue(name: String, type: String) -> String {
        var encodedValue = name

        let jsonTypes = ["Any", "Map<String: Any>", "Int", "String", "Float", "Double", "Boolean"]

        if !jsonTypes.contains(type), !jsonTypes.map({ "List<\($0)>" }).contains(type), !jsonTypes.map({ "Map<String: \($0)>" }).contains(type) {
            if type.hasPrefix("[[") {
                encodedValue += ".map { x -> x.encode() }"
            } else if type.hasPrefix("Map<String: List<") {
                encodedValue += ".mapValues { y -> y.encode() }"
            } else {
                encodedValue += ".encode()"
            }
        }

        return encodedValue
    }

    override func getPropertyContext(_ property: Property) -> Context {
        var context = super.getPropertyContext(property)

        let type = context["type"] as! String
        let name = context["name"] as! String

        context["optionalType"] = type + (property.nullable ? "?" : "")
        var encodedValue = getEncodedValue(name: getName(name), type: type)

        if !property.required, let range = encodedValue.range(of: ".") {
            encodedValue = encodedValue.replacingOccurrences(of: ".", with: "?.", options: [], range: range)
        }

        context["encodedValue"] = encodedValue
        context["isAnyType"] = type.contains("Any")
        return context
    }

    override func getResponseContext(_ response: OperationResponse) -> Context {
        var context = super.getResponseContext(response)
        let type = context["type"] as? String ?? ""
        context["isAnyType"] = type.contains("Any")
        return context
    }

    override func getEscapedType(_ name: String) -> String {
        if inbuiltTypes.contains(name) {
            return "\(name)Type"
        }
        return "`\(name)`"
    }

    override func getEscapedName(_ name: String) -> String {
        return "`\(name)`"
    }
}
