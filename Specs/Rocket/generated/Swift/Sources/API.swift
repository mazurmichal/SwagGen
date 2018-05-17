//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

/** An Orchestration Layer that takes ISL services and packages them in a more targeted way for front-end applications.
This in turn makes client integration easier and reduces the complexity and size of front-end applications.

Rocket is also customisable - allowing UI engineers to ‘remix’ the existing back-end services into something that
best suits the application they are developing.
 */
public struct Rocket {

    /// Whether to discard any errors when decoding optional properties
    public static var safeOptionalDecoding = false

     /// Whether to remove invalid elements instead of throwing when decoding arrays
    public static var safeArrayDecoding = false

    /// The date formatter used for Date's with format "date-time". See DateDay.dateFormat for "date" format
    public static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.Z"
        return formatter
    }()

    public static let version = "1.0.0"

    public enum Account {}
    public enum App {}
    public enum Authorization {}
    public enum Content {}
    public enum Profile {}
    public enum Registration {}
    public enum Support {}

}
