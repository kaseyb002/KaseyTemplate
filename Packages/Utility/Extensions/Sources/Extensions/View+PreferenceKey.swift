import SwiftUI

extension View {
    public func storeSize<K: PreferenceKey>(
        in key: K.Type
    ) -> some View where K.Value == CGSize {
        background(
            GeometryReader { geo in
                Color.clear
                    .preference(key: key, value: geo.size)
            }
        )
    }
    
    public func storeSize<K: PreferenceKey>(
        _ size: CGSize,
        in key: K.Type
    ) -> some View where K.Value == CGSize {
        preference(key: key, value: size)
    }
    
    public func onSizeChange<K: PreferenceKey>(
        for key: K.Type,
        perform action: @escaping (K.Value) -> Void
    ) -> some View where K.Value == CGSize {
        onPreferenceChange(key, perform: action)
    }
}
