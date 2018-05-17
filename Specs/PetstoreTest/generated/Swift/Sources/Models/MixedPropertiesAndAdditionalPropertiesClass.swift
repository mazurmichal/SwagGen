//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class MixedPropertiesAndAdditionalPropertiesClass: Codable, Equatable {

    public var dateTime: Date?

    public var map: [String: Animal]?

    public var uuid: UUID?

    public init(dateTime: Date? = nil, map: [String: Animal]? = nil, uuid: UUID? = nil) {
        self.dateTime = dateTime
        self.map = map
        self.uuid = uuid
    }

    private enum CodingKeys: String, CodingKey {
        case dateTime
        case map
        case uuid
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dateTime = try container.decodeIfPresent(.dateTime)
        map = try container.decodeIfPresent(.map)
        uuid = try container.decodeIfPresent(.uuid)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(dateTime, forKey: .dateTime)
        try container.encodeIfPresent(map, forKey: .map)
        try container.encodeIfPresent(uuid, forKey: .uuid)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? MixedPropertiesAndAdditionalPropertiesClass else { return false }
      guard self.dateTime == object.dateTime else { return false }
      guard self.map == object.map else { return false }
      guard self.uuid == object.uuid else { return false }
      return true
    }

    public static func == (lhs: MixedPropertiesAndAdditionalPropertiesClass, rhs: MixedPropertiesAndAdditionalPropertiesClass) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
