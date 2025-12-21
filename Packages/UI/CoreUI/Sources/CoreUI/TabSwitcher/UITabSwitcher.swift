import UIKit
import SwiftUI
import Combine
import Extensions

public final class UITabSwitcher: UICollectionViewController {
    // MARK: - Properties
    private let controller: TabSwitcher.Controller
    private var screens: [TabSwitcher.Controller.Screen] = [] {
        didSet { collectionView.reloadData() }
    }
    private let didDisplayScreen: (TabSwitcher.Controller.Screen) -> Void
    private var subscriptions: Set<AnyCancellable> = []

    // MARK: - Init
    init(
        controller: TabSwitcher.Controller,
        didDisplayScreen: @escaping (TabSwitcher.Controller.Screen) -> Void
    ) {
        self.controller = controller
        self.didDisplayScreen = didDisplayScreen
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Lifecycle
extension UITabSwitcher {
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupSubscriptions()
    }
}

// MARK: - Setup
extension UITabSwitcher {
    private func setup() {
        collectionView.backgroundColor = .clear
        collectionView.register(ContainerCell.self, forCellWithReuseIdentifier: ContainerCell.reuseId)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { // something to do with SwiftUI containment
            self.collectionView.collectionViewLayout.invalidateLayout()
        }
    }
}

// MARK: - Data Source
extension UITabSwitcher {
    public override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        screens.count
    }

    public override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ContainerCell.reuseId,
            for: indexPath
        ) as? ContainerCell else {
            return .init()
        }
        let screen: TabSwitcher.Controller.Screen = screens[indexPath.row]
        let viewController: HiddenNavBarChildHostingController = .init(rootView: screen.view)
        viewController.view.backgroundColor = .clear
        embed(viewController, into: cell.container)
        return cell
    }
}

// MARK: - Delegate
extension UITabSwitcher {
    public override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        didDisplayScreen(currentScreen)
    }
}

// MARK: - ViewController Management
extension UITabSwitcher {
    private var currentScreen: TabSwitcher.Controller.Screen {
        let width: CGFloat = max(collectionView.frame.size.width, 1)
        let currentIndex: Int = Int(collectionView.contentOffset.x / width)
        return screens[currentIndex]
    }

    private func scroll(to screen: TabSwitcher.Controller.Screen) {
        guard let index: Int = index(for: screen) else { return }
        collectionView.setContentOffset(
            .init(
                x: view.bounds.width * CGFloat(index),
                y: .zero
            ),
            animated: true
        )
    }

    private func index(for screen: TabSwitcher.Controller.Screen) -> Int? {
        screens.firstIndex(of: screen)
    }
}

// MARK: - Layout
extension UITabSwitcher: UICollectionViewDelegateFlowLayout {
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        view.bounds.size
    }

    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        .zero
    }

    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        .zero
    }

    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        .zero
    }

    public override func viewWillTransition(
        to size: CGSize,
        with coordinator: UIViewControllerTransitionCoordinator
    ) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

// MARK: - Setup Subscriptions
extension UITabSwitcher {
    private func setupSubscriptions() {
        controller.$screens
            .sink { [unowned self] screens in
                self.screens = screens
            }
            .store(in: &subscriptions)

        controller.$selectedScreen
            .compactMap { $0 }
            .removeDuplicates()
            .filter { [unowned self] in currentScreen != $0 }
            .sink { [unowned self] screen in
                scroll(to: screen)
            }
            .store(in: &subscriptions)
    }
}

private final class ContainerCell: UICollectionViewCell {
    static let reuseId = "containerCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(container)
        container.pinAllSides(to: self)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let container: UIView = {
        let view: UIView = .init()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}
