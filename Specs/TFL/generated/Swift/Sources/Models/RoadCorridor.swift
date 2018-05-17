//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class RoadCorridor: Codable, Equatable {

    /** The Bounds of the Corridor, given by the south-east followed by the north-west co-ordinate
            pair in geoJSON format e.g. "[[-1.241531,51.242151],[1.641223,53.765721]]" */
    public var bounds: String?

    /** The display name of the Corridor e.g. "North Circular (A406)". This
            may be identical to the Id. */
    public var displayName: String?

    /** The Envelope of the Corridor, given by the corner co-ordinates of a rectangular (four-point) polygon
            in geoJSON format e.g. "[[-1.241531,51.242151],[-1.241531,53.765721],[1.641223,53.765721],[1.641223,51.242151]]" */
    public var envelope: String?

    /** The group name of the Corridor e.g. "Central London". Most corridors are not grouped, in which case this field can be null. */
    public var group: String?

    /** The Id of the Corridor e.g. "A406" */
    public var id: String?

    /** The end of the period over which status has been aggregated, or null if this is the current corridor status. */
    public var statusAggregationEndDate: Date?

    /** The start of the period over which status has been aggregated, or null if this is the current corridor status. */
    public var statusAggregationStartDate: Date?

    /** Standard multi-mode status severity code */
    public var statusSeverity: String?

    /** Description of the status severity as applied to RoadCorridors */
    public var statusSeverityDescription: String?

    /** URL to retrieve this Corridor. */
    public var url: String?

    public init(bounds: String? = nil, displayName: String? = nil, envelope: String? = nil, group: String? = nil, id: String? = nil, statusAggregationEndDate: Date? = nil, statusAggregationStartDate: Date? = nil, statusSeverity: String? = nil, statusSeverityDescription: String? = nil, url: String? = nil) {
        self.bounds = bounds
        self.displayName = displayName
        self.envelope = envelope
        self.group = group
        self.id = id
        self.statusAggregationEndDate = statusAggregationEndDate
        self.statusAggregationStartDate = statusAggregationStartDate
        self.statusSeverity = statusSeverity
        self.statusSeverityDescription = statusSeverityDescription
        self.url = url
    }

    private enum CodingKeys: String, CodingKey {
        case bounds
        case displayName
        case envelope
        case group
        case id
        case statusAggregationEndDate
        case statusAggregationStartDate
        case statusSeverity
        case statusSeverityDescription
        case url
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        bounds = try container.decodeIfPresent(.bounds)
        displayName = try container.decodeIfPresent(.displayName)
        envelope = try container.decodeIfPresent(.envelope)
        group = try container.decodeIfPresent(.group)
        id = try container.decodeIfPresent(.id)
        statusAggregationEndDate = try container.decodeIfPresent(.statusAggregationEndDate)
        statusAggregationStartDate = try container.decodeIfPresent(.statusAggregationStartDate)
        statusSeverity = try container.decodeIfPresent(.statusSeverity)
        statusSeverityDescription = try container.decodeIfPresent(.statusSeverityDescription)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(bounds, forKey: .bounds)
        try container.encodeIfPresent(displayName, forKey: .displayName)
        try container.encodeIfPresent(envelope, forKey: .envelope)
        try container.encodeIfPresent(group, forKey: .group)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(statusAggregationEndDate, forKey: .statusAggregationEndDate)
        try container.encodeIfPresent(statusAggregationStartDate, forKey: .statusAggregationStartDate)
        try container.encodeIfPresent(statusSeverity, forKey: .statusSeverity)
        try container.encodeIfPresent(statusSeverityDescription, forKey: .statusSeverityDescription)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? RoadCorridor else { return false }
      guard self.bounds == object.bounds else { return false }
      guard self.displayName == object.displayName else { return false }
      guard self.envelope == object.envelope else { return false }
      guard self.group == object.group else { return false }
      guard self.id == object.id else { return false }
      guard self.statusAggregationEndDate == object.statusAggregationEndDate else { return false }
      guard self.statusAggregationStartDate == object.statusAggregationStartDate else { return false }
      guard self.statusSeverity == object.statusSeverity else { return false }
      guard self.statusSeverityDescription == object.statusSeverityDescription else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: RoadCorridor, rhs: RoadCorridor) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
