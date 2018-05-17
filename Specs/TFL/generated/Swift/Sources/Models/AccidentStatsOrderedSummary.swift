//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class AccidentStatsOrderedSummary: Codable, Equatable {

    public var accidents: Int?

    public var borough: String?

    public var year: Int?

    public init(accidents: Int? = nil, borough: String? = nil, year: Int? = nil) {
        self.accidents = accidents
        self.borough = borough
        self.year = year
    }

    private enum CodingKeys: String, CodingKey {
        case accidents
        case borough
        case year
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        accidents = try container.decodeIfPresent(.accidents)
        borough = try container.decodeIfPresent(.borough)
        year = try container.decodeIfPresent(.year)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(accidents, forKey: .accidents)
        try container.encodeIfPresent(borough, forKey: .borough)
        try container.encodeIfPresent(year, forKey: .year)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? AccidentStatsOrderedSummary else { return false }
      guard self.accidents == object.accidents else { return false }
      guard self.borough == object.borough else { return false }
      guard self.year == object.year else { return false }
      return true
    }

    public static func == (lhs: AccidentStatsOrderedSummary, rhs: AccidentStatsOrderedSummary) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
