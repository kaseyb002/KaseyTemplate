import SwiftUI

public final class HiddenNavBarHostingController<V: View>: HostingController<V> {
    public override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.navigationController?.isNavigationBarHidden = true
        }
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}
