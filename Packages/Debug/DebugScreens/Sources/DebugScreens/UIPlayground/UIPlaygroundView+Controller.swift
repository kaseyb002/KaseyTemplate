import Combine
import Foundation
import Extensions
import Colors
import CoreUI
import Stage10Model
import WordsModel

extension UIPlaygroundView {
    final class Controller: ObservableObject {
        @Published var model: Model
        private let dataStore: UIPlaygroundViewDataStore
        private let didSelectNavAction: (NavAction) -> Void
        private var subscriptions: Set<AnyCancellable> = []
        
        init(
            model: Model,
            dataStore: UIPlaygroundViewDataStore,
            didSelectNavAction: @escaping (NavAction) -> Void
        ) {
            self.model = model
            self.dataStore = dataStore
            self.didSelectNavAction = didSelectNavAction
            
            handle(action: .initiated)
        }
    }
}

// MARK: - Actions
extension UIPlaygroundView.Controller {
    func handle(action: UIPlaygroundView.Action) {
        switch action {
        case .initiated:
            setupSubscriptions()

        case .ui(let action):
            handle(ui: action)
        }
    }

    private func handle(ui action: UIPlaygroundView.Action.UI) {
        switch action {
        case .noLimitHoldEmUIPlaygroundTapped:
            didSelectNavAction(.noLimitHoldEmUIPlayground)
            
        case .noLimitHoldEmPlaceBetTapped:
            didSelectNavAction(
                .placeBet(
                    min: 1,
                    max: 100,
                    increment: 1,
                    didPlaceBet: { amount in
                        showHUD(title: "Bet \(amount.moneyString)")
                    }
                )
            )
            
        case .stage10UIPlaygroundTapped:
            didSelectNavAction(.stage10UIPlayground)
            
        case .stage10LayDownTapped:
            didSelectNavAction(
                .stage10Laydown(
                    stage: .one,
                    cards: [
                        .init(id: 1, cardType: .number(.init(number: .four, color: .blue))),
                        .init(id: 2, cardType: .number(.init(number: .four, color: .yellow))),
                        .init(id: 3, cardType: .number(.init(number: .four, color: .green))),
                        .init(id: 4, cardType: .number(.init(number: .twelve, color: .blue))),
                        .init(id: 5, cardType: .number(.init(number: .twelve, color: .yellow))),
                        .init(id: 6, cardType: .number(.init(number: .twelve, color: .green))),
                        .init(id: 7, cardType: .number(.init(number: .twelve, color: .green))),
                        .init(id: 8, cardType: .number(.init(number: .nine, color: .blue))),
                        .init(id: 9, cardType: .number(.init(number: .ten, color: .yellow))),
                        .init(id: 10, cardType: .number(.init(number: .eleven, color: .green))),
                    ],
                    setWildAs: { _, _ in
                        .init(id: 1, cardType: .number(.init(number: .eight, color: .blue)))
                    },
                    didCompleteForm: { form in
                        showHUD(title: "Lay down successful")
                    }
                )
            )
            
        case .stage10ChooseSkipTapped:
            try? didSelectNavAction(
                .stage10ChooseSkip(
                    myUserID: nil,
                    playerHands: [
                        .fake(
                            completed: [
                                .init(
                                    requirementType: .colorSet(
                                        .init(
                                            requiredCount: 1,
                                            color: .blue,
                                            cards: [.init(
                                                id: 1,
                                                cardType: .number(
                                                    .init(
                                                        number: .eight,
                                                        color: .blue
                                                    )
                                                )
                                            )]
                                        )
                                    )
                                ),
                                .init(
                                    requirementType: .colorSet(
                                        .init(
                                            requiredCount: 1,
                                            color: .blue,
                                            cards: [.init(
                                                id: 2,
                                                cardType: .number(
                                                    .init(
                                                        number: .eight,
                                                        color: .blue
                                                    )
                                                )
                                            )]
                                        )
                                    )
                                ),
                                .init(
                                    requirementType: .colorSet(
                                        .init(
                                            requiredCount: 1,
                                            color: .blue,
                                            cards: [.init(
                                                id: 3,
                                                cardType: .number(
                                                    .init(
                                                        number: .eight,
                                                        color: .blue
                                                    )
                                                )
                                            )]
                                        )
                                    )
                                ),
                            ]
                        ),
                        .fake(),
                        .fake(),
                        .fake(),
                        .fake(),
                    ],
                    skips: [:],
                    didSelectPlayer: { playerHand in
                        Task { @MainActor in
                            await Task.ifDebugSleep(for: .seconds(1))
                            showHUD(title: "skipped \(playerHand.player.name)")
                        }
                    }
                )
            )
            
        case .soundEffectsTapped:
            didSelectNavAction(.soundEffects)
            
        case .wordsSelectManyTilesTapped:
            didSelectNavAction(
                .wordsSelectManyTiles(
                    tiles: [
                        .init(id: 1, letter: .s),
                        .init(id: 2, letter: .c),
                        .init(id: 3, letter: .r),
                        .init(id: 4, letter: .a),
                        .init(id: 5, letter: .b),
                        .init(id: 6, letter: .b),
                        .init(id: 7, letter: .l),
                        .init(id: 8, letter: .e),
                        .init(id: 9, letter: .t),
                        .init(id: 10, letter: .i),
                        .init(id: 11, letter: .l),
                        .init(id: 12, letter: .e),
                        .init(id: 13, letter: .s),
                    ],
                    didSelect: { selectedTiles in
                        let letters = selectedTiles
                            .sorted { $0.id < $1.id }
                            .map { $0.letter.rawValue }
                            .joined()
                        showHUD(title: "Selected: \(letters)")
                    }
                )
            )
            
        case .wordsSelectTileTapped:
            didSelectNavAction(
                .wordsSelectTile(
                    tiles: [
                        .init(id: 1, letter: .a),
                        .init(id: 2, letter: .b),
                        .init(id: 3, letter: .c),
                        .init(id: 4, letter: .d),
                        .init(id: 5, letter: .e),
                        .init(id: 6, letter: .f),
                        .init(id: 7, letter: .g),
                    ],
                    didSelect: { tile in
                        showHUD(title: "Selected: \(tile.letter.rawValue)")
                    }
                )
            )
            
        case .wordsSelectLetterTapped:
            didSelectNavAction(.wordsSelectLetter(didSelect: { letter in
                showHUD(title: "Selected: \(letter.rawValue)")
            }))
        }
    }
}

// MARK: Subcontrollers
extension UIPlaygroundView.Controller {
    
}

// MARK: - Subscriptions
extension UIPlaygroundView.Controller {
    private func setupSubscriptions() {
        
    }
}
