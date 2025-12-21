import Extensions
import UIKit

public final class TitleSubtitleHeaderUIView: UIView {
    // MARK: Subviews
    private let stackView: UIStackView = makeStackView()
    public let titleLabel: UILabel = makeTitleLabel()
    public let subtitleLabel: UILabel = makeSubtitleLabel()
    
    // MARK: Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Setup
extension TitleSubtitleHeaderUIView {
    private func setup() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 5),
        ])
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
    }
}

// MARK: Subviews
extension TitleSubtitleHeaderUIView {
    private static func makeStackView() -> UIStackView {
        let stackView: UIStackView = .init()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .center
        return stackView
    }
    private static func makeTitleLabel() -> UILabel {
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        let descriptor: UIFontDescriptor = UIFont.preferredFont(forTextStyle: .body)
            .fontDescriptor
            .withSymbolicTraits(.traitBold)!
        label.font = .init(descriptor: descriptor, size: .zero)
        return label
    }
    
    private static func makeSubtitleLabel() -> UILabel {
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .footnote)
        return label
    }
}
