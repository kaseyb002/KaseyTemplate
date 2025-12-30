import MediaUI
import Colors
import CoreUI
import SwiftUI

struct AddLinkView: LoadableView {
    @State var model: Model
    let deps: Deps
    @FocusState private var focused: Bool

    var body: some View {
        ScrollView {
            VStack {
                urlTextField
                linkPreviewIfNeeded
            }
        }
        .scrollIndicators(.hidden)
        .contentMargins(20)
        .animation(.default, value: model.url == nil)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                closeButtonIfNeeded
            }
            
            if let url: URL = model.url {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        handle(action: .ui(.saveTapped(url)))
                    } label: {
                        Text("Done")
                            .foregroundStyle(Color.ijInteractive)
                            .bold()
                    }
                }
            }
        }
        .subscribeToUpdates(subscribeToUpdates)
    }
}

// MARK: - Subviews
extension AddLinkView {
    private var urlTextField: some View {
        TextField("Link", text: $model.linkString)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .font(.title2)
            .bold()
            .foregroundStyle(Color.ijLabel)
            .keyboardType(.URL)
            .focused($focused)
            .onAppear { focused = true }
    }
    
    @ViewBuilder
    private var linkPreviewIfNeeded: some View {
        if let url: URL = model.url {
            LinkPreviewView(
                url: url,
                maxSize: CGSize(width: 300, height: 300)
            )
        }
    }

    @ViewBuilder
    private var closeButtonIfNeeded: some View {
        if model.isPresentedModally {
            CloseButton(didTap: {
                handle(action: .ui(.closeTapped))
            })
        }
    }
}
