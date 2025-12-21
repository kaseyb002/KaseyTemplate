import UIKit

// MARK: - Autolayout
public extension UIView {
    
    func addAspectRatioContraint(
        height: CGFloat,
        width: CGFloat
    ) {
        addConstraint(
            .init(
                item: self,
                attribute: .height,
                relatedBy: .equal,
                toItem: self,
                attribute: .width,
                multiplier: height / width,
                constant: 1
            )
        )
    }
    
    func constrainHeight(
        to height: CGFloat
    ) {
        heightAnchor
            .constraint(
                equalToConstant: height
            ).isActive = true
    }
    
    func constrainWidth(
        to width: CGFloat
    ) {
        widthAnchor
            .constraint(
                equalToConstant: width
            ).isActive = true
    }
    
    func constrainSize(
        to size: CGSize
    ) {
        constrainHeight(
            to: size.height
        )
        constrainWidth(
            to: size.width
        )
    }
    
    func pinAllSides(
        to view: UIView,
        margins: UIEdgeInsets = .zero
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate(
                [
                    topAnchor
                        .constraint(
                            equalTo: view.topAnchor,
                            constant: margins.top
                        ),
                    leadingAnchor
                        .constraint(
                            equalTo: view.leadingAnchor,
                            constant: margins.left
                        ),
                    view.trailingAnchor
                        .constraint(
                            equalTo: trailingAnchor,
                            constant: margins.right
                        ),
                    view.bottomAnchor
                        .constraint(
                            equalTo: bottomAnchor,
                            constant: margins.bottom
                        ),
                ]
            )
    }
    
    func insertAndPin(
        _ view: UIView,
        at index: Int = 0,
        margins: UIEdgeInsets = .zero
    ) {
        insertSubview(
            view,
            at: index
        )
        view
            .pinAllSides(
                to: self,
                margins: margins
            )
    }
    
    func addAndPin(
        _ view: UIView,
        margins: UIEdgeInsets = .zero
    ) {
        addSubview(
            view
        )
        view
            .pinAllSides(
                to: self,
                margins: margins
            )
    }
    
    func pinToLeading(
        of view: UIView,
        margin: CGFloat = 0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate(
                [
                    leadingAnchor
                        .constraint(
                            equalTo: view.leadingAnchor,
                            constant: margin
                        ),
                ]
            )
    }
    
    func pinToSafeLeadingSafe(
        of view: UIView,
        margin: CGFloat = 0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate(
                [
                    leadingAnchor
                        .constraint(
                            equalTo: view.leadingAnchor,
                            constant: margin
                        ),
                ]
            )
    }
    
    func pinToTrailing(
        of view: UIView,
        margin: CGFloat = 0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate(
                [
                    view.trailingAnchor
                        .constraint(
                            equalTo: trailingAnchor,
                            constant: margin
                        )
                ]
            )
    }
    
    func pinToSafeTrailing(
        of view: UIView,
        margin: CGFloat = 0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate(
                [
                    view.safeAreaLayoutGuide.trailingAnchor
                        .constraint(
                            equalTo: trailingAnchor,
                            constant: margin
                        )
                ]
            )
    }
    
    func pinToTop(
        of view: UIView,
        margin: CGFloat = 0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate(
                [
                    topAnchor
                        .constraint(
                            equalTo: view.topAnchor,
                            constant: margin
                        ),
                ]
            )
    }
    
    func pinToSafeTop(
        of view: UIView,
        margin: CGFloat = 0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate(
                [
                    topAnchor
                        .constraint(
                            equalTo: view.safeAreaLayoutGuide.topAnchor,
                            constant: margin
                        ),
                ]
            )
    }
    
    func pinToBottom(
        of view: UIView,
        margin: CGFloat = 0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate(
                [
                    view.bottomAnchor
                        .constraint(
                            equalTo: bottomAnchor,
                            constant: margin
                        )
                ]
            )
    }
    
    func pinToSafeBottom(
        of view: UIView,
        margin: CGFloat = 0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate(
                [
                    view.safeAreaLayoutGuide.bottomAnchor
                        .constraint(
                            equalTo: bottomAnchor,
                            constant: margin
                        )
                ]
            )
    }
    
    func centerHorizontally(
        to view: UIView,
        offset: CGFloat = 0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate(
                [
                    centerXAnchor
                        .constraint(
                            equalTo: view.centerXAnchor,
                            constant: offset
                        ),
                ]
            )
    }
    
    func centerVertically(
        to view: UIView,
        offset: CGFloat = 0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate(
                [
                    centerYAnchor
                        .constraint(
                            equalTo: view.centerYAnchor,
                            constant: offset
                        ),
                ]
            )
    }
    
    func setEqualWidth(
        to view: UIView
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate(
                [
                    widthAnchor
                        .constraint(
                            equalTo: view.widthAnchor,
                            multiplier: 1
                        )
                ]
            )
    }
    
    func setEqualHeight(
        to view: UIView
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate(
                [
                    heightAnchor
                        .constraint(
                            equalTo: view.heightAnchor,
                            multiplier: 1
                        )
                ]
            )
    }
    
    func center(
        to view: UIView,
        xOffSet: CGFloat = 0,
        yOffset: CGFloat = 0
    ) {
        centerHorizontally(
            to: view,
            offset: xOffSet
        )
        centerVertically(
            to: view,
            offset: yOffset
        )
    }
}
