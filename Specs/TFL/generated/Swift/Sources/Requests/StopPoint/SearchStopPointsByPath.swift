//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension TFL.StopPoint {

    /** Search StopPoints by their common name, or their 5-digit Countdown Bus Stop Code. */
    public enum SearchStopPointsByPath {

        public static let service = APIService<Response>(id: "searchStopPointsByPath", tag: "StopPoint", method: "GET", path: "/StopPoint/Search/{query}", hasBody: false)

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
                super.init(service: SearchStopPointsByPath.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(query: String, modes: [String]? = nil, faresOnly: Bool? = nil, maxResults: Int? = nil, lines: [String]? = nil, includeHubs: Bool? = nil) {
                let options = Options(query: query, modes: modes, faresOnly: faresOnly, maxResults: maxResults, lines: lines, includeHubs: includeHubs)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "query" + "}", with: "\(self.options.query)")
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
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

            public class Status200: APIModel {

                public var from: Int?

                public var matches: [SearchMatch]?

                public var maxScore: Double?

                public var page: Int?

                public var pageSize: Int?

                public var provider: String?

                public var query: String?

                public var total: Int?

                public init(from: Int? = nil, matches: [SearchMatch]? = nil, maxScore: Double? = nil, page: Int? = nil, pageSize: Int? = nil, provider: String? = nil, query: String? = nil, total: Int? = nil) {
                    self.from = from
                    self.matches = matches
                    self.maxScore = maxScore
                    self.page = page
                    self.pageSize = pageSize
                    self.provider = provider
                    self.query = query
                    self.total = total
                }

                public required init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: StringCodingKey.self)

                    from = try container.decodeIfPresent("from")
                    matches = try container.decodeArrayIfPresent("matches")
                    maxScore = try container.decodeIfPresent("maxScore")
                    page = try container.decodeIfPresent("page")
                    pageSize = try container.decodeIfPresent("pageSize")
                    provider = try container.decodeIfPresent("provider")
                    query = try container.decodeIfPresent("query")
                    total = try container.decodeIfPresent("total")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: StringCodingKey.self)

                    try container.encodeIfPresent(from, forKey: "from")
                    try container.encodeIfPresent(matches, forKey: "matches")
                    try container.encodeIfPresent(maxScore, forKey: "maxScore")
                    try container.encodeIfPresent(page, forKey: "page")
                    try container.encodeIfPresent(pageSize, forKey: "pageSize")
                    try container.encodeIfPresent(provider, forKey: "provider")
                    try container.encodeIfPresent(query, forKey: "query")
                    try container.encodeIfPresent(total, forKey: "total")
                }

                public func isEqual(to object: Any?) -> Bool {
                  guard let object = object as? Status200 else { return false }
                  guard self.from == object.from else { return false }
                  guard self.matches == object.matches else { return false }
                  guard self.maxScore == object.maxScore else { return false }
                  guard self.page == object.page else { return false }
                  guard self.pageSize == object.pageSize else { return false }
                  guard self.provider == object.provider else { return false }
                  guard self.query == object.query else { return false }
                  guard self.total == object.total else { return false }
                  return true
                }

                public static func == (lhs: Status200, rhs: Status200) -> Bool {
                    return lhs.isEqual(to: rhs)
                }
            }
            public typealias SuccessType = Status200

            /** OK */
            case status200(Status200)

            public var success: Status200? {
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
                case 200: self = try .status200(decoder.decode(Status200.self, from: data))
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
