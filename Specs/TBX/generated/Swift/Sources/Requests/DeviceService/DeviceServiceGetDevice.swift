//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension TBX.DeviceService {

    public enum DeviceServiceGetDevice {

        public static let service = APIService<Response>(id: "DeviceService.getDevice", tag: "DeviceService", method: "GET", path: "/DeviceServices/getDevice", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                public var apiKey: String

                public var deviceToken: String

                public var deviceType: String

                public init(apiKey: String, deviceToken: String, deviceType: String) {
                    self.apiKey = apiKey
                    self.deviceToken = deviceToken
                    self.deviceType = deviceType
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: DeviceServiceGetDevice.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(apiKey: String, deviceToken: String, deviceType: String) {
                let options = Options(apiKey: apiKey, deviceToken: deviceToken, deviceType: deviceType)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                params["api_key"] = options.apiKey
                params["deviceToken"] = options.deviceToken
                params["deviceType"] = options.deviceType
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [String: Any]

            /** Request was successful */
            case status200([String: Any])

            public var success: [String: Any]? {
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
                decoder.dateDecodingStrategy = .formatted(TBX.dateFormatter)
                switch statusCode {
                case 200: self = try .status200(decoder.decodeAny([String: Any].self, from: data))
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
