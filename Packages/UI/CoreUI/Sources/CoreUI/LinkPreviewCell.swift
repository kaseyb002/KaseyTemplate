import LinkPresentation
import UIKit

public final class LinkPreviewCell: UICollectionViewCell {
    // MARK: - Properties
    private let linkView: LPLinkView = .init(url: URL(string: "about:blank")!)
    private let activityIndicator: UIActivityIndicatorView = .init(style: .medium)
    private let errorLabel: UILabel = .init()
    
    private var currentTask: Task<Void, Never>?
    private var currentURL: URL?
    
    // MARK: - Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    // MARK: - Lifecycle
    public override func prepareForReuse() {
        super.prepareForReuse()
        currentTask?.cancel()
        currentTask = nil
        currentURL = nil
        linkView.isHidden = true
        activityIndicator.stopAnimating()
        errorLabel.isHidden = true
    }
    
    // MARK: - Configuration
    public func configure(url: URL) {
        guard url != currentURL else { return }
        currentURL = url
        
        // Cancel any existing task
        currentTask?.cancel()
        
        // Show loading state
        linkView.isHidden = true
        errorLabel.isHidden = true
        activityIndicator.startAnimating()
        
        // Fetch metadata
        currentTask = Task { @MainActor [weak self] in
            await self?.fetchAndDisplayMetadata(for: url)
        }
    }
    
    // MARK: - Setup
    private func setupViews() {
        // Configure link view
        linkView.translatesAutoresizingMaskIntoConstraints = false
        linkView.isHidden = true
        contentView.addSubview(linkView)
        
        // Configure activity indicator
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        contentView.addSubview(activityIndicator)
        
        // Configure error label
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.text = "Unable to load preview"
        errorLabel.textColor = .secondaryLabel
        errorLabel.textAlignment = .center
        errorLabel.numberOfLines = 0
        errorLabel.isHidden = true
        contentView.addSubview(errorLabel)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            // Link view fills the content view
            linkView.topAnchor.constraint(equalTo: contentView.topAnchor),
            linkView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            linkView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            linkView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // Activity indicator centered
            activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // Error label centered with padding
            errorLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            errorLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            errorLabel.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 16),
            errorLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    // MARK: - Metadata Fetching
    @MainActor
    private func fetchAndDisplayMetadata(for url: URL) async {
        let provider = LPMetadataProvider()
        
        do {
            let metadata = try await provider.startFetchingMetadata(for: url)
            
            // Check if task was cancelled
            guard !Task.isCancelled, currentURL == url else { return }
            
            // Update link view with metadata
            linkView.metadata = metadata
            linkView.isHidden = false
            activityIndicator.stopAnimating()
            
        } catch {
            // Check if task was cancelled
            guard !Task.isCancelled, currentURL == url else { return }
            
            // Show error state
            activityIndicator.stopAnimating()
            errorLabel.isHidden = false
        }
    }
}
