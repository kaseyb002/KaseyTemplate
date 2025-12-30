import Extensions
import Foundation
import SampleData

extension GroupBackground {
    public static func fake(
        id: String = UUID().uuidString,
        title: String = Lorem.title,
        imageURL: URL = .randomImageURL,
    ) -> GroupBackground {
        .init(
            id: id,
            title: title,
            imageURL: imageURL
        )
    }
}
