//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension TFL.StopPoint {

    /** Search StopPoints by their common name, or their 5-digit Countdown Bus Stop Code. */
    public enum SearchStopPoints {

        public static let service = APIService<Response>(id: "searchStopPoints", tag: "StopPoint", method: "GET", path: "/StopPoint/Search", hasBody: false, securityRequirements: [])

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The query string, case-insensitive. Leading and trailing wildcards are applied automatically. */
                public var query: String

                /** An optional, parameter separated list of the modes to filter by */
                public var modes: [String]?

                /** True to only return stations in that have Fares data available for single fares to another station. */
                public var faresOnly: Bool?

                /** An optional result limit, defaulting to and with a maximum of 50. Since children of the stop point heirarchy are returned for matches,
            it is possible that the flattened result set will contain more than 50 items. */
                public var maxResults: Int?

                /** An optional, parameter separated list of the lines to filter by */
                public var lines: [String]?

                /** If true, returns results including HUBs. */
                public var includeHubs: Bool?

                public init(query: String, modes: [String]? = nil, faresOnly: Bool? = nil, maxResults: Int? = nil, lines: [String]? = nil, includeHubs: Bool? = nil) {
                    self.query = query
                    self.modes = modes
                    self.faresOnly = faresOnly
                    self.maxResults = maxResults
                    self.lines = lines
                    self.includeHubs = includeHubs
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: SearchStopPoints.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(query: String, modes: [String]? = nil, faresOnly: Bool? = nil, maxResults: Int? = nil, lines: [String]? = nil, includeHubs: Bool? = nil) {
                let options = Options(query: query, modes: modes, faresOnly: faresOnly, maxResults: maxResults, lines: lines, includeHubs: includeHubs)
                self.init(options: options)
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                params["query"] = options.query
                if let modes = options.modes?.joined(separator: ",") {
                  params["modes"] = modes
                }
                if let faresOnly = options.faresOnly {
                  params["faresOnly"] = faresOnly
                }
                if let maxResults = options.maxResults {
                  params["maxResults"] = maxResults
                }
                if let lines = options.lines?.joined(separator: ",") {
                  params["lines"] = lines
                }
                if let includeHubs = options.includeHubs {
                  params["includeHubs"] = includeHubs
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = SearchResponse

            /** OK */
            case status200(SearchResponse)

            public var success: SearchResponse? {
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

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(SearchResponse.self, from: data))
                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
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
