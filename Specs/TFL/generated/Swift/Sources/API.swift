//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public struct TFL {

    /// Whether to discard any errors when decoding optional properties
    public static var safeOptionalDecoding = false

    /// Whether to remove invalid elements instead of throwing when decoding arrays
    public static var safeArrayDecoding = false

    /// Used to encode Dates when uses as string params
    public static let dateEncodingFormatter = DateFormatter(formatString: "yyyy-MM-dd'T'HH:mm:ssZZZZZ")
    public static let jsonDateEncodingStrategy: JSONEncoder.DateEncodingStrategy = .formatted(TFL.dateEncodingFormatter)
    public static let defaultJSONEncoder: JSONEncoder = {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.dateEncodingStrategy = TFL.jsonDateEncodingStrategy

        return jsonEncoder
    }()

    public static let version = "v1"

    public enum AccidentStats {}
    public enum AirQuality {}
    public enum BikePoint {}
    public enum Cabwise {}
    public enum Journey {}
    public enum Line {}
    public enum Mode {}
    public enum Occupancy {}
    public enum Place {}
    public enum Road {}
    public enum Search {}
    public enum StopPoint {}
    public enum TravelTime {}
    public enum Vehicle {}

    public enum Server {

        public static let main = "https://api.tfl.gov.uk"
    }
}
