//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class RouteSearchMatch: Codable, Equatable {

    public var id: String?

    public var lat: Double?

    public var lineId: String?

    public var lineName: String?

    public var lineRouteSection: [LineRouteSection]?

    public var lon: Double?

    public var matchedRouteSections: [MatchedRouteSections]?

    public var matchedStops: [MatchedStop]?

    public var mode: String?

    public var name: String?

    public var url: String?

    public init(id: String? = nil, lat: Double? = nil, lineId: String? = nil, lineName: String? = nil, lineRouteSection: [LineRouteSection]? = nil, lon: Double? = nil, matchedRouteSections: [MatchedRouteSections]? = nil, matchedStops: [MatchedStop]? = nil, mode: String? = nil, name: String? = nil, url: String? = nil) {
        self.id = id
        self.lat = lat
        self.lineId = lineId
        self.lineName = lineName
        self.lineRouteSection = lineRouteSection
        self.lon = lon
        self.matchedRouteSections = matchedRouteSections
        self.matchedStops = matchedStops
        self.mode = mode
        self.name = name
        self.url = url
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case lat
        case lineId
        case lineName
        case lineRouteSection
        case lon
        case matchedRouteSections
        case matchedStops
        case mode
        case name
        case url
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decodeIfPresent(.id)
        lat = try container.decodeIfPresent(.lat)
        lineId = try container.decodeIfPresent(.lineId)
        lineName = try container.decodeIfPresent(.lineName)
        lineRouteSection = try container.decodeArrayIfPresent(.lineRouteSection)
        lon = try container.decodeIfPresent(.lon)
        matchedRouteSections = try container.decodeArrayIfPresent(.matchedRouteSections)
        matchedStops = try container.decodeArrayIfPresent(.matchedStops)
        mode = try container.decodeIfPresent(.mode)
        name = try container.decodeIfPresent(.name)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(lat, forKey: .lat)
        try container.encodeIfPresent(lineId, forKey: .lineId)
        try container.encodeIfPresent(lineName, forKey: .lineName)
        try container.encodeIfPresent(lineRouteSection, forKey: .lineRouteSection)
        try container.encodeIfPresent(lon, forKey: .lon)
        try container.encodeIfPresent(matchedRouteSections, forKey: .matchedRouteSections)
        try container.encodeIfPresent(matchedStops, forKey: .matchedStops)
        try container.encodeIfPresent(mode, forKey: .mode)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? RouteSearchMatch else { return false }
      guard self.id == object.id else { return false }
      guard self.lat == object.lat else { return false }
      guard self.lineId == object.lineId else { return false }
      guard self.lineName == object.lineName else { return false }
      guard self.lineRouteSection == object.lineRouteSection else { return false }
      guard self.lon == object.lon else { return false }
      guard self.matchedRouteSections == object.matchedRouteSections else { return false }
      guard self.matchedStops == object.matchedStops else { return false }
      guard self.mode == object.mode else { return false }
      guard self.name == object.name else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: RouteSearchMatch, rhs: RouteSearchMatch) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
