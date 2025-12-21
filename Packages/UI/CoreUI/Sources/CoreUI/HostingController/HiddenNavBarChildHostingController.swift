import SwiftUI

public final class HiddenNavBarChildHostingController<V: View>: UIHostingController<V> {
    public override var navigationController: UINavigationController? { nil }
}
