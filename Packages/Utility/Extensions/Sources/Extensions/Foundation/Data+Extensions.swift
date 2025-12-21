import Foundation

extension Data {
    public var prettyJSON: NSString {
        NSString(data: self, encoding: String.Encoding.utf8.rawValue) ?? "bad data"
    }
}
