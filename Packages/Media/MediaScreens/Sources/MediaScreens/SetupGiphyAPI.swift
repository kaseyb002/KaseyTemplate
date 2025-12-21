import GiphyUISDK

public enum SetupGiphyAPI {
    public static func register(apiKey: String) {
        Giphy.configure(apiKey: apiKey)
    }
}
