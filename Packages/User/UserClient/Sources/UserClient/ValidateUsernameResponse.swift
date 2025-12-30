import Foundation
import UserModel

struct ValidateUsernameResponse: Decodable {
    let status: ValidUsernameStatus
    
    enum CodingKeys: String, CodingKey {
        case status = "detail"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let status: ValidUsernameStatus = try? container.decode(
            ValidUsernameStatus.self,
            forKey: .status
        ) {
            self.status = status
        } else {
            self.status = .otherError
        }
    }
}
