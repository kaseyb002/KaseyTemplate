import UIKit

// MARK: - Embedding Child ViewControllers
extension UIViewController {
    public func embed(
        _ childViewController: UIViewController,
        into container: UIView,
        margins: UIEdgeInsets = .zero,
        fadeInDuration: TimeInterval? = nil
    ) {
        container.subviews.forEach { $0.removeFromSuperview() }
        
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParent()
        
        childViewController.willMove(toParent: self)
        
        addChild(childViewController)
        
        childViewController.view.frame = container.bounds
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(childViewController.view)
        
        NSLayoutConstraint.activate([
            childViewController.view.topAnchor.constraint(equalTo: container.topAnchor, constant: margins.top),
            container.bottomAnchor.constraint(equalTo: childViewController.view.bottomAnchor, constant: margins.bottom),
            
            childViewController.view.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: margins.left),
            container.trailingAnchor.constraint(equalTo: childViewController.view.trailingAnchor, constant: margins.right)
        ])
        
        childViewController.didMove(toParent: self)
        
        container.backgroundColor = .clear // IB has default white background which is annoying
        
        if let fadeInDuration = fadeInDuration {
            container.alpha = 0.0
            UIView.animate(withDuration: fadeInDuration) { container.alpha = 1.0 }
        }
    }
    
    public func removeChildViewControllers<T: UIViewController>(ofType: T.Type) {
        let stickyFooterViewControllers = children.filter { $0 is T }
        stickyFooterViewControllers.forEach {
            $0.willMove(toParent: nil)
            $0.view.removeFromSuperview()
            $0.removeFromParent()
        }
    }
}
