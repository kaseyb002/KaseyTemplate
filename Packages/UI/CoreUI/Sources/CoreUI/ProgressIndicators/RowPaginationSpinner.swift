import Colors
import SwiftUI

public struct RowPaginationSpinner: View {
    public var body: some View {
        HStack {
            Spacer()
            LoadingSpinnerView()
                .id(UUID())
            Spacer()
        }
        .listRowBackground(Color.ijBackground)
        .listRowSeparator(.hidden)
    }
    
    public init() {
        
    }
}
