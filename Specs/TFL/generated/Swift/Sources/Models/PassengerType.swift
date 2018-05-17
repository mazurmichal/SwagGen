//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class PassengerType: Codable, Equatable {

    public var description: String?

    public var displayName: String?

    public var displayOrder: Int?

    public var type: String?

    public init(description: String? = nil, displayName: String? = nil, displayOrder: Int? = nil, type: String? = nil) {
        self.description = description
        self.displayName = displayName
        self.displayOrder = displayOrder
        self.type = type
    }

    private enum CodingKeys: String, CodingKey {
        case description
        case displayName
        case displayOrder
        case type
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        description = try container.decodeIfPresent(.description)
        displayName = try container.decodeIfPresent(.displayName)
        displayOrder = try container.decodeIfPresent(.displayOrder)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(displayName, forKey: .displayName)
        try container.encodeIfPresent(displayOrder, forKey: .displayOrder)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? PassengerType else { return false }
      guard self.description == object.description else { return false }
      guard self.displayName == object.displayName else { return false }
      guard self.displayOrder == object.displayOrder else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: PassengerType, rhs: PassengerType) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
