//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class PlacePolygon: Codable, Equatable {

    public var commonName: String?

    public var geoPoints: [GeoPoint]?

    public init(commonName: String? = nil, geoPoints: [GeoPoint]? = nil) {
        self.commonName = commonName
        self.geoPoints = geoPoints
    }

    private enum CodingKeys: String, CodingKey {
        case commonName
        case geoPoints
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        commonName = try container.decodeIfPresent(.commonName)
        geoPoints = try container.decodeArrayIfPresent(.geoPoints)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(commonName, forKey: .commonName)
        try container.encodeIfPresent(geoPoints, forKey: .geoPoints)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? PlacePolygon else { return false }
      guard self.commonName == object.commonName else { return false }
      guard self.geoPoints == object.geoPoints else { return false }
      return true
    }

    public static func == (lhs: PlacePolygon, rhs: PlacePolygon) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
