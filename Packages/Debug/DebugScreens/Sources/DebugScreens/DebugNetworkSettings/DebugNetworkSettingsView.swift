import DebugModel
import SwiftUI

struct DebugNetworkSettingsView: View {
    @ObservedObject var controller: Controller
    private var model: Model { controller.model }
    
    var body: some View {
        Form {
            Section(
                content: {
                    serverEnvironmentPicker
                }, footer: {
                    Text("Changing environments will automatically sign you out.")
                }
            )
            
            Section(
                content: {
                    showSocketConnectionStatusToggle
                }, footer: {
                    Text("It shows a little 🔴 or 🟢 dot if the socket is connected.")
                }
            )
        }
        .scrollContentBackground(.hidden)
    }
}

// MARK: - Subviews
extension DebugNetworkSettingsView {
    private var serverEnvironmentPicker: some View {
        Picker(
            "Server Environment",
            selection: .init(
                get: { model.debugConfig.serverEnvironment },
                set: { controller.handle(action: .ui(.serverEnvironmentSelected($0))) }
            )
        ) {
            ForEach(DebugConfig.ServerEnvironment.allCases, id: \.rawValue) { serverEnvironment in
                Text(serverEnvironment.rawValue)
                    .tag(serverEnvironment)
            }
        }
        .listRowBackground(Color.ijSecondaryBackground)
    }
    
    private var showSocketConnectionStatusToggle: some View {
        Toggle(
            "Show Socket Connection Indicators",
            isOn: .init(
                get: { model.debugConfig.isShowingSocketConnectionIndicators },
                set: { controller.handle(action: .ui(.showSocketConnectionStatusToggled(isOn: $0))) }
            )
        )
        .listRowBackground(Color.ijSecondaryBackground)
    }
}
