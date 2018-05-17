//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

/** Represents a period for which a planned works is valid. */
public class ValidityPeriod: Codable, Equatable {

    /** Gets or sets the start date. */
    public var fromDate: Date?

    /** If true is a realtime status rather than planned or info */
    public var isNow: Bool?

    /** Gets or sets the end date. */
    public var toDate: Date?

    public init(fromDate: Date? = nil, isNow: Bool? = nil, toDate: Date? = nil) {
        self.fromDate = fromDate
        self.isNow = isNow
        self.toDate = toDate
    }

    private enum CodingKeys: String, CodingKey {
        case fromDate
        case isNow
        case toDate
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        fromDate = try container.decodeIfPresent(.fromDate)
        isNow = try container.decodeIfPresent(.isNow)
        toDate = try container.decodeIfPresent(.toDate)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(fromDate, forKey: .fromDate)
        try container.encodeIfPresent(isNow, forKey: .isNow)
        try container.encodeIfPresent(toDate, forKey: .toDate)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? ValidityPeriod else { return false }
      guard self.fromDate == object.fromDate else { return false }
      guard self.isNow == object.isNow else { return false }
      guard self.toDate == object.toDate else { return false }
      return true
    }

    public static func == (lhs: ValidityPeriod, rhs: ValidityPeriod) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
