//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public struct TBX {

    /// Whether to discard any errors when decoding optional properties
    public static var safeOptionalDecoding = false

    /// Whether to remove invalid elements instead of throwing when decoding arrays
    public static var safeArrayDecoding = false

    /// Used to encode Dates when uses as string params
    public static let dateEncodingFormatter = DateFormatter(formatString: "yyyy-MM-dd'T'HH:mm:ssZZZZZ")
    public static let jsonDateEncodingStrategy: JSONEncoder.DateEncodingStrategy = .formatted(TBX.dateEncodingFormatter)
    public static let defaultJSONEncoder: JSONEncoder = {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.dateEncodingStrategy = TBX.jsonDateEncodingStrategy

        return jsonEncoder
    }()

    public static let version = "2.4.1"

    public enum AuthorizationService {}
    public enum DeviceService {}
    public enum UserService {}
    public enum Auth {}

    public enum Server {

        public static let main = "/v2"
    }
}
