import Extensions
import SwiftUI
@preconcurrency import UserNotifications

@MainActor
open class HostingController<V: View>: UIHostingController<V>, NotificationsBlockable {
    private let largeTitle: Bool
    public var blockNotification: (UNNotification) -> Bool = { _ in false }
    
    public init(
        rootView: V,
        largeTitle: Bool = false
    ) {
        self.largeTitle = largeTitle
        super.init(rootView: rootView)
    }
    
    @available(*, unavailable)
    @MainActor @objc required dynamic public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    open override func viewDidLoad() {
        super.viewDidLoad()
        if largeTitle {
            navigationItem.largeTitleDisplayMode = .always
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            navigationItem.largeTitleDisplayMode = .never
        }
        navigationItem.backButtonDisplayMode = .minimal
        view.backgroundColor = .ijBackground
        navigationController?.navigationBar.tintColor = .ijInteractive

        DispatchQueue.main.async {
            self.navigationController?.isNavigationBarHidden = false
        }
    }

    open override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    public func block(notification: UNNotification) -> Bool {
        blockNotification(notification)
    }
}
