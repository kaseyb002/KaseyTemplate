import SwiftUI

extension UIColor {
    public static var ijInteractive: UIColor {
        currentTheme.interactive
    }
    
    public static var ijLabel: UIColor {
        currentTheme.label
    }
    
    public static var ijSecondaryLabel: UIColor {
        currentTheme.secondaryLabel
    }
    
    public static var ijTertiaryLabel: UIColor {
        currentTheme.tertiaryLabel
    }
    
    public static var ijQuarternaryLabel: UIColor {
        currentTheme.quarternaryLabel
    }
    
    public static var ijInverseLabel: UIColor {
        .ijBackground
    }
    
    public static var ijInverseSecondaryLabel: UIColor {
        .ijSecondaryBackground
    }
    
    public static var ijBackground: UIColor {
        currentTheme.background
    }
    
    public static var ijSecondaryBackground: UIColor {
        currentTheme.secondaryBackground
    }
    
    public static var ijTertiaryBackground: UIColor {
        currentTheme.tertiaryBackground
    }
    
    public static var ijInverseBackground: UIColor {
        .ijLabel
    }
    
    public static var ijInverseSecondaryBackground: UIColor {
        .ijSecondaryLabel
    }

    public static var ijFill: UIColor {
        currentTheme.fill
    }
    
    public static var ijSecondaryFill: UIColor {
        currentTheme.secondaryBackground
    }
    
    public static var ijTertiaryFill: UIColor {
        currentTheme.tertiaryFill
    }
    
    public static var ijQuarternaryFill: UIColor {
        currentTheme.quarternaryFill
    }
    
    public static var ijLink: UIColor {
        currentTheme.link
    }
    
    public static var ijSeparator: UIColor {
        currentTheme.separator
    }
    
    public static var moneyGreen: UIColor {
        UIColor(resource: .moneyGreen)
    }
}

extension Color {
    public static var ijInteractive: Self {
        .init(.ijInteractive)
    }
    
    public static var ijLabel: Self {
        .init(.ijLabel)
    }
    
    public static var ijSecondaryLabel: Self {
        .init(.ijSecondaryLabel)
    }
    
    public static var ijTertiaryLabel: Self {
        .init(.ijTertiaryLabel)
    }
    
    public static var ijQuarternaryLabel: Self {
        .init(.ijQuarternaryLabel)
    }
    
    public static var ijInverseLabel: Self {
        .init(.ijInverseLabel)
    }
    
    public static var ijInverseSecondaryLabel: Self {
        .init(.ijInverseSecondaryLabel)
    }
    
    public static var ijBackground: Self {
        .init(.ijBackground)
    }
    
    public static var ijSecondaryBackground: Self {
        .init(.ijSecondaryBackground)
    }
    
    public static var ijTertiaryBackground: Self {
        .init(.ijTertiaryBackground)
    }
    
    public static var ijInverseBackground: Self {
        .init(.ijInverseBackground)
    }

    public static var ijInverseSecondaryBackground: Self {
        .init(.ijInverseSecondaryBackground)
    }
    
    public static var ijFill: Self {
        .init(.ijFill)
    }
    
    public static var ijSecondaryFill: Self {
        .init(.ijSecondaryFill)
    }
    
    public static var ijTertiaryFill: Self {
        .init(.ijTertiaryFill)
    }
    
    public static var ijQuarternaryFill: Self {
        .init(.ijQuarternaryFill)
    }
    
    public static var ijLink: Self {
        .init(.ijLink)
    }
    
    public static var ijSeparator: Self {
        .init(.ijSeparator)
    }
    
    public static var moneyGreen: Self {
        .init(.moneyGreen)
    }
    
    public static var strokeColorAgainstGreenFelt: Self {
        .white.opacity(0.3)
    }
    
    public static var labelColorAgainstGreenFelt: Self {
        .white
    }
}

// MARK: - Themes
private var currentTheme: Theme {
    if #available(iOS 26.0, *) {
        return .clubhouse
    } else {
        return .clubhouse
    }
}

private struct Theme {
    let interactive: UIColor
    // MARK: Labels
    let label: UIColor
    let secondaryLabel: UIColor
    let tertiaryLabel: UIColor
    let quarternaryLabel: UIColor
    // MARK: Backgrounds
    let background: UIColor
    let secondaryBackground: UIColor
    let tertiaryBackground: UIColor
    // MARK: Fills
    let fill: UIColor
    let secondaryFill: UIColor
    let tertiaryFill: UIColor
    let quarternaryFill: UIColor
    // MARK: Other
    let link: UIColor
    let separator: UIColor
}

private extension Theme {
    static let carolina: Theme = .init(
        interactive: .init(
            light: .init(resource: .carolinaBlue),
            dark: .init(resource: .cherryBlossom)
        ),
        label: .label,
        secondaryLabel: .secondaryLabel,
        tertiaryLabel: .tertiaryLabel,
        quarternaryLabel: .quaternaryLabel,
        background: .init(
            light: .init(resource: .dogwood),
            dark: .systemBackground
        ),
        secondaryBackground: .init(
            light: .init(resource: .dogwood).darkened(by: 0.05),
            dark: .secondarySystemBackground
        ),
        tertiaryBackground: .tertiarySystemBackground,
        fill: .systemFill,
        secondaryFill: .secondarySystemFill,
        tertiaryFill: .tertiarySystemFill,
        quarternaryFill: .quaternarySystemFill,
        link: .link,
        separator: .separator
    )
    
    static let classical: Theme = .init(
        interactive: .init(
            light: .init(resource: .classicalBlueStrong),
            dark: .init(resource: .classicalRed)
        ),
        label: .label,
        secondaryLabel: .secondaryLabel,
        tertiaryLabel: .tertiaryLabel,
        quarternaryLabel: .quaternaryLabel,
        background: .init(
            light: .init(resource: .classicalWhite).darkened(by: -0.05),
            dark: .init(resource: .classicalGray).darkened(by: 0.20)
        ),
        secondaryBackground: .init(
            light: .init(resource: .classicalWhite).darkened(by: 0.05),
            dark: .init(resource: .classicalGray).darkened(by: 0.10)
        ),
        tertiaryBackground: .tertiarySystemBackground,
        fill: .init(
            light: .init(resource: .classicalWhite),
            dark: .init(resource: .classicalGray)
        ),
        secondaryFill: .secondarySystemFill,
        tertiaryFill: .tertiarySystemFill,
        quarternaryFill: .quaternarySystemFill,
        link: .link,
        separator: .separator
    )
    
    static let japanese: Theme = .init(
        interactive: .init(
            light: .init(resource: .juice),
            dark: .init(resource: .classicalRed)
        ),
        label: .label,
        secondaryLabel: .secondaryLabel,
        tertiaryLabel: .tertiaryLabel,
        quarternaryLabel: .quaternaryLabel,
        background: .init(
            light: .init(resource: .japanesePaper).darkened(by: -0.05),
            dark: .init(resource: .classicalGray).darkened(by: 0.20)
        ),
        secondaryBackground: .init(
            light: .init(resource: .japanesePaper).darkened(by: 0.05),
            dark: .init(resource: .classicalGray).darkened(by: 0.10)
        ),
        tertiaryBackground: .tertiarySystemBackground,
        fill: .init(
            light: .init(resource: .japanesePaper),
            dark: .init(resource: .classicalGray)
        ),
        secondaryFill: .secondarySystemFill,
        tertiaryFill: .tertiarySystemFill,
        quarternaryFill: .quaternarySystemFill,
        link: .link,
        separator: .separator
    )
    
    static let coffeeShop: Theme = .init(
        interactive: .init(
            light: .init(resource: .berry),
            dark: .init(resource: .smoothie)
        ),
        label: .label,
        secondaryLabel: .secondaryLabel,
        tertiaryLabel: .tertiaryLabel,
        quarternaryLabel: .quaternaryLabel,
        background: .init(
            light: .init(resource: .latte).darkened(by: -0.05),
            dark: .init(resource: .groundCoffee)
        ),
        secondaryBackground: .init(
            light: .init(resource: .latte).darkened(by: 0.05),
            dark: .init(resource: .groundCoffee).darkened(by: 0.10)
        ),
        tertiaryBackground: .tertiarySystemBackground,
        fill: .init(
            light: .init(resource: .latte),
            dark: .init(resource: .groundCoffee)
        ),
        secondaryFill: .secondarySystemFill,
        tertiaryFill: .tertiarySystemFill,
        quarternaryFill: .quaternarySystemFill,
        link: .link,
        separator: .separator
    )
    
    static let clubhouse: Theme = .init(
        interactive: .init(
            light: .init(resource: .juice),
            dark: .init(resource: .classicalRed)
        ),
//        interactive: .init(
//            light: .init(resource: .moneyGreen),
//            dark: .init(resource: .moneyGreen)
//        ),
        label: .label,
        secondaryLabel: .secondaryLabel,
        tertiaryLabel: .tertiaryLabel,
        quarternaryLabel: .quaternaryLabel,
        background: .init(
            light: .init(resource: .japanesePaper),
            dark: .init(resource: .classicalGray).darkened(by: 0.20)
        ),
        secondaryBackground: .init(
            light: .init(resource: .japanesePaper).darkened(by: 0.05),
            dark: .init(resource: .classicalGray).darkened(by: 0.15)
        ),
        tertiaryBackground: .tertiarySystemBackground,
        fill: .init(
            light: .init(resource: .japanesePaper),
            dark: .init(resource: .classicalGray)
        ),
        secondaryFill: .secondarySystemFill,
        tertiaryFill: .tertiarySystemFill,
        quarternaryFill: .quaternarySystemFill,
        link: .link,
        separator: .separator
    )
    
    static let monotone: Theme = .init(
        interactive: .init(
            light: .label,
            dark: .init(resource: .classicalWhite)
        ),
        label: .label,
        secondaryLabel: .secondaryLabel,
        tertiaryLabel: .tertiaryLabel,
        quarternaryLabel: .quaternaryLabel,
        background: .init(
            light: .init(resource: .classicalWhite).darkened(by: -0.05),
            dark: .init(resource: .classicalGray).darkened(by: 0.20)
        ),
        secondaryBackground: .init(
            light: .init(resource: .classicalWhite).darkened(by: 0.05),
            dark: .init(resource: .classicalGray).darkened(by: 0.10)
        ),
        tertiaryBackground: .tertiarySystemBackground,
        fill: .init(
            light: .init(resource: .classicalWhite),
            dark: .init(resource: .classicalGray)
        ),
        secondaryFill: .secondarySystemFill,
        tertiaryFill: .tertiarySystemFill,
        quarternaryFill: .quaternarySystemFill,
        link: .link,
        separator: .separator
    )
    
    static let poker: Theme = .init(
        interactive: .init(
            light: .init(resource: .juice),
            dark: .init(resource: .juice)
        ),
        label: .label,
        secondaryLabel: .secondaryLabel,
        tertiaryLabel: .tertiaryLabel,
        quarternaryLabel: .quaternaryLabel,
        background: .init(
            light: .init(resource: .carpetRed).darkened(by: -0.05),
            dark: .init(resource: .carpetRed).darkened(by: 0.20)
        ),
        secondaryBackground: .init(
            light: .init(resource: .carpetRed).darkened(by: 0.05),
            dark: .init(resource: .carpetRed).darkened(by: 0.10)
        ),
        tertiaryBackground: .tertiarySystemBackground,
        fill: .init(
            light: .init(resource: .carpetRed),
            dark: .init(resource: .carpetRed)
        ),
        secondaryFill: .secondarySystemFill,
        tertiaryFill: .tertiarySystemFill,
        quarternaryFill: .quaternarySystemFill,
        link: .link,
        separator: .separator
    )
    
    static let system: Theme = .init(
        interactive: .systemBlue,
        label: .label,
        secondaryLabel: .secondaryLabel,
        tertiaryLabel: .tertiaryLabel,
        quarternaryLabel: .quaternaryLabel,
        background: .systemBackground,
        secondaryBackground: .secondarySystemBackground,
        tertiaryBackground: .tertiarySystemBackground,
        fill: .systemFill,
        secondaryFill: .secondarySystemFill,
        tertiaryFill: .tertiarySystemFill,
        quarternaryFill: .quaternarySystemFill,
        link: .link,
        separator: .separator
    )
}

// MARK: - Convenience Inits
private extension UIColor {
    convenience init(light: UIColor, dark: UIColor) {
        self.init(dynamicProvider: { traits in
            switch traits.userInterfaceStyle {
            case .dark:
                return dark
            default:
                return light
            }}
        )
    }
}

private extension UIColor {
    private func makeColor(componentDelta: CGFloat) -> UIColor {
        var red: CGFloat = 0
        var blue: CGFloat = 0
        var green: CGFloat = 0
        var alpha: CGFloat = 0
        
        // Extract r,g,b,a components from the
        // current UIColor
        getRed(
            &red,
            green: &green,
            blue: &blue,
            alpha: &alpha
        )
        
        // Create a new UIColor modifying each component
        // by componentDelta, making the new UIColor either
        // lighter or darker.
        return UIColor(
            red: add(componentDelta, toComponent: red),
            green: add(componentDelta, toComponent: green),
            blue: add(componentDelta, toComponent: blue),
            alpha: alpha
        )
    }
    private func add(_ value: CGFloat, toComponent: CGFloat) -> CGFloat {
        max(0, min(1, toComponent + value))
    }
    
    func lightened(by componentDelta: CGFloat) -> UIColor {
        makeColor(componentDelta: componentDelta)
    }
    
    func darkened(by componentDelta: CGFloat) -> UIColor {
        makeColor(componentDelta: -1 * componentDelta)
    }
}
