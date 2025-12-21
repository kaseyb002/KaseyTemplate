import SwiftUI

public enum AvatarImage: String, Equatable, CaseIterable, Sendable {
    case badger
    case buck
    case donkey
    case fox
    case snake
    case turkey
    case wolf
    case bluebird
    case chicken
    case cow
    case deer
    case duck
    case duck2
    case dog
    case mouse
    case horse2
    case kitten
    case llama
    case rabbit
    case bear
    case bull
    case cardinal
    case frog
    case horse1
    case pig
    case puppy
    case ram
    case sheep
    case skunk
    case squirrel
    case turtle
    
    public var image: Image {
        switch self {
        case .badger:
            Image(.AnimalAvatars.badger)
        case .buck:
            Image(.AnimalAvatars.buck)
        case .donkey:
            Image(.AnimalAvatars.donkey)
        case .fox:
            Image(.AnimalAvatars.fox)
        case .snake:
            Image(.AnimalAvatars.snake)
        case .turkey:
            Image(.AnimalAvatars.turkey)
        case .wolf:
            Image(.AnimalAvatars.wolf)
        case .bluebird:
            Image(.AnimalAvatars.bluebird)
        case .chicken:
            Image(.AnimalAvatars.chicken)
        case .cow:
            Image(.AnimalAvatars.cow)
        case .deer:
            Image(.AnimalAvatars.deer)
        case .horse2:
            Image(.AnimalAvatars.horse2)
        case .kitten:
            Image(.AnimalAvatars.kitten)
        case .llama:
            Image(.AnimalAvatars.llama)
        case .rabbit:
            Image(.AnimalAvatars.rabbit)
        case .bear:
            Image(.AnimalAvatars.bear)
        case .bull:
            Image(.AnimalAvatars.bull)
        case .cardinal:
            Image(.AnimalAvatars.cardinal)
        case .frog:
            Image(.AnimalAvatars.frog)
        case .horse1:
            Image(.AnimalAvatars.horse1)
        case .pig:
            Image(.AnimalAvatars.pig)
        case .puppy:
            Image(.AnimalAvatars.puppy)
        case .ram:
            Image(.AnimalAvatars.ram)
        case .sheep:
            Image(.AnimalAvatars.sheep)
        case .skunk:
            Image(.AnimalAvatars.skunk)
        case .squirrel:
            Image(.AnimalAvatars.squirrel)
        case .turtle:
            Image(.AnimalAvatars.turtle)
        case .duck2:
            Image(.AnimalAvatars.duck2)
        case .dog:
            Image(.AnimalAvatars.dog)
        case .mouse:
            Image(.AnimalAvatars.mouse)
        case .duck:
            Image(.AnimalAvatars.duck)
        }
    }
    
    public var uiImage: UIImage {
        switch self {
        case .badger:
           UIImage(resource: .AnimalAvatars.badger)
        case .buck:
           UIImage(resource: .AnimalAvatars.buck)
        case .donkey:
           UIImage(resource: .AnimalAvatars.donkey)
        case .fox:
           UIImage(resource: .AnimalAvatars.fox)
        case .snake:
           UIImage(resource: .AnimalAvatars.snake)
        case .turkey:
           UIImage(resource: .AnimalAvatars.turkey)
        case .wolf:
           UIImage(resource: .AnimalAvatars.wolf)
        case .bluebird:
           UIImage(resource: .AnimalAvatars.bluebird)
        case .chicken:
           UIImage(resource: .AnimalAvatars.chicken)
        case .cow:
           UIImage(resource: .AnimalAvatars.cow)
        case .deer:
           UIImage(resource: .AnimalAvatars.deer)
        case .horse2:
           UIImage(resource: .AnimalAvatars.horse2)
        case .kitten:
           UIImage(resource: .AnimalAvatars.kitten)
        case .llama:
           UIImage(resource: .AnimalAvatars.llama)
        case .rabbit:
           UIImage(resource: .AnimalAvatars.rabbit)
        case .bear:
           UIImage(resource: .AnimalAvatars.bear)
        case .bull:
           UIImage(resource: .AnimalAvatars.bull)
        case .cardinal:
           UIImage(resource: .AnimalAvatars.cardinal)
        case .frog:
           UIImage(resource: .AnimalAvatars.frog)
        case .horse1:
           UIImage(resource: .AnimalAvatars.horse1)
        case .pig:
           UIImage(resource: .AnimalAvatars.pig)
        case .puppy:
           UIImage(resource: .AnimalAvatars.puppy)
        case .ram:
           UIImage(resource: .AnimalAvatars.ram)
        case .sheep:
           UIImage(resource: .AnimalAvatars.sheep)
        case .skunk:
           UIImage(resource: .AnimalAvatars.skunk)
        case .squirrel:
           UIImage(resource: .AnimalAvatars.squirrel)
        case .turtle:
           UIImage(resource: .AnimalAvatars.turtle)
        case .duck2:
           UIImage(resource: .AnimalAvatars.duck2)
        case .dog:
           UIImage(resource: .AnimalAvatars.dog)
        case .mouse:
           UIImage(resource: .AnimalAvatars.mouse)
        case .duck:
           UIImage(resource: .AnimalAvatars.duck)
        }
    }
}
