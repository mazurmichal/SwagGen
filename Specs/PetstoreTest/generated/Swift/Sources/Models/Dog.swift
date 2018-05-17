//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class Dog: Animal {

    public var breed: String?

    public init(className: String, color: String? = nil, breed: String? = nil) {
        self.breed = breed
        super.init(className: className, color: color)
    }

    private enum CodingKeys: String, CodingKey {
        case breed
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        breed = try container.decodeIfPresent(.breed)
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(breed, forKey: .breed)
        try super.encode(to: encoder)
    }

    override public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? Dog else { return false }
      guard self.breed == object.breed else { return false }
      return super.isEqual(to: object)
    }
}
