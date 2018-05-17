//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension TFL.Place {

    public enum PlaceGetStreetsByPostCode {

        public static let service = APIService<Response>(id: "Place_GetStreetsByPostCode", tag: "Place", method: "GET", path: "/Place/Address/Streets/{Postcode}", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                public var postcode: String

                public var postcodeInputPostcode: String?

                public init(postcode: String, postcodeInputPostcode: String? = nil) {
                    self.postcode = postcode
                    self.postcodeInputPostcode = postcodeInputPostcode
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: PlaceGetStreetsByPostCode.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(postcode: String, postcodeInputPostcode: String? = nil) {
                let options = Options(postcode: postcode, postcodeInputPostcode: postcodeInputPostcode)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                params["postcode"] = options.postcode
                if let postcodeInputPostcode = options.postcodeInputPostcode {
                  params["postcodeInput.postcode"] = postcodeInputPostcode
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Object

            /** OK */
            case status200(Object)

            public var success: Object? {
                switch self {
                case .status200(let response): return response
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                }
            }

            public init(statusCode: Int, data: Data) throws {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(TFL.dateFormatter)
                switch statusCode {
                case 200: self = try .status200(decoder.decode(Object.self, from: data))
                default: throw APIError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
