//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class ActiveServiceType: Codable, Equatable {

    public var mode: String?

    public var serviceType: String?

    public init(mode: String? = nil, serviceType: String? = nil) {
        self.mode = mode
        self.serviceType = serviceType
    }

    private enum CodingKeys: String, CodingKey {
        case mode
        case serviceType
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        mode = try container.decodeIfPresent(.mode)
        serviceType = try container.decodeIfPresent(.serviceType)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(mode, forKey: .mode)
        try container.encodeIfPresent(serviceType, forKey: .serviceType)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? ActiveServiceType else { return false }
      guard self.mode == object.mode else { return false }
      guard self.serviceType == object.serviceType else { return false }
      return true
    }

    public static func == (lhs: ActiveServiceType, rhs: ActiveServiceType) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
