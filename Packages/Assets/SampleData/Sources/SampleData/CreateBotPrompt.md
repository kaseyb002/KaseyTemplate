#  Create Famous Bot Prompt

Here is my FamousBot struct:

```
public struct FamousBot: Decodable, Equatable {
    public let id: String
    public let displayName: String
    public let fullName: String
    public let bio: String
    public let imageURL: URL?
    public let wikipediaURL: URL?
}
```

Here's an example of a bot you created for Mozart:

```
    public static var mozart: FamousBot {
        .init(
            id: "mozart",
            displayName: "Mozart",
            fullName: "Wolfgang Amadeus Mozart",
            bio: "Austrian composer and child prodigy who created more than 600 works, including symphonies, operas, and concertos.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984702/mozart_qogvbl.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Wolfgang_Amadeus_Mozart")
        )
    }
```

Please make another bot for <#name#>. Use a <#imageURL#> placeholder for the imageURL for now. Only use the person's family/last name for the displayName.
