import SwiftUI

public struct LoadingResultScreen<Content: View>: View {
    // MARK: - Properries
    private let template: LoadingResultScreenTemplate
    private let bottomContent: Content
    
    // MARK: - Init
    public init(
        template: LoadingResultScreenTemplate,
        @ViewBuilder bottomContent: () -> Content = { EmptyView() }
    ) {
        self.template = template
        self.bottomContent = bottomContent()
    }
    
    // MARK: - Body
    public var body: some View {
        VStack(spacing: 50) {
            Spacer()
            VStack(spacing: 20) {
                iconIfNeeded
                VStack(spacing: 10) {
                    titleIfNeeded
                    messageIfNeeded
                }
            }
            buttonIfNeeded
            bottomContent
            Spacer()
        }
        .padding(20)
    }
}

// MARK: - Subviews
extension LoadingResultScreen {
    @ViewBuilder
    private var iconIfNeeded: some View {
        if let icon = template.icon {
            icon.image
                .resizable()
                .foregroundColor(icon.color)
                .aspectRatio(contentMode: .fit)
                .frame(width: 75)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var titleIfNeeded: some View {
        if let title: String = template.title {
            Text(title)
                .font(.title)
                .foregroundStyle(Color.ijLabel)
                .bold()
                .multilineTextAlignment(.center)
        }
    }
    
    @ViewBuilder
    private var messageIfNeeded: some View {
        if let message: String = template.message {
            Text(message)
                .foregroundStyle(Color.ijLabel)
                .multilineTextAlignment(.center)
        }
    }
    
    @ViewBuilder
    private var buttonIfNeeded: some View {
        if let buttonConfig = template.buttonConfig {
            Button(action: buttonConfig.didSelect) {
                Text(buttonConfig.title)
                    .foregroundStyle(Color.ijLabel)
                    .font(.title3)
                    .bold()
                    .minimumScaleFactor(0.6)
                    .padding()
            }
            .background(.regularMaterial)
            .mask(Capsule())
        } else {
            EmptyView()
        }
    }
}

#if DEBUG
struct EmptyResultScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingResultScreen(
            template: .init(
                icon: .init(
                    image: Image(
                        systemName: "books.vertical"
                    ),
                    color: .blue
                ),
                message: "No Books Found",
                buttonConfig: .init(
                    title: "Go Back",
                    didSelect: {
                        print("Go back tapped")
                    })
            )
        )
    }
}
#endif
