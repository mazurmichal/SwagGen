//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class HasOnlyReadOnly: Codable, Equatable {

    public var bar: String?

    public var foo: String?

    public init(bar: String? = nil, foo: String? = nil) {
        self.bar = bar
        self.foo = foo
    }

    private enum CodingKeys: String, CodingKey {
        case bar
        case foo
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        bar = try container.decodeIfPresent(.bar)
        foo = try container.decodeIfPresent(.foo)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(bar, forKey: .bar)
        try container.encodeIfPresent(foo, forKey: .foo)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? HasOnlyReadOnly else { return false }
      guard self.bar == object.bar else { return false }
      guard self.foo == object.foo else { return false }
      return true
    }

    public static func == (lhs: HasOnlyReadOnly, rhs: HasOnlyReadOnly) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
