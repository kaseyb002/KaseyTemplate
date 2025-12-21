import SwiftUI

public enum BackgroundImage: Equatable, CaseIterable {
    case alps
    case basketballGym
    case beach
    case basement
    case campout
    case classroom
    case coffeeShop
    case dojo
    case dubai
    case garage
    case garden
    case highclere
    case kitchen
    case library
    case london
    case lumberYard
    case mexico
    case newYorkCity
    case paris
    case richGuysHouse
    case singapore
    case skyscraper
    case streetCorner
    case streetCornerDark
    case tokyo
    case trench
    case vegas
    
    public var image: Image {
        switch self {
        case .alps:
            Image(.Backgrounds.alps)
        case .basketballGym:
            Image(.Backgrounds.basketballGym)
        case .beach:
            Image(.Backgrounds.beach)
        case .basement:
            Image(.Backgrounds.basement)
        case .campout:
            Image(.Backgrounds.campout)
        case .classroom:
            Image(.Backgrounds.classroom)
        case .coffeeShop:
            Image(.Backgrounds.coffeeShop)
        case .dojo:
            Image(.Backgrounds.dojo)
        case .dubai:
            Image(.Backgrounds.dubai)
        case .garage:
            Image(.Backgrounds.garage)
        case .garden:
            Image(.Backgrounds.garden)
        case .highclere:
            Image(.Backgrounds.highclere)
        case .kitchen:
            Image(.Backgrounds.kitchen)
        case .library:
            Image(.Backgrounds.library)
        case .london:
            Image(.Backgrounds.london)
        case .lumberYard:
            Image(.Backgrounds.lumberYard)
        case .mexico:
            Image(.Backgrounds.mexico)
        case .newYorkCity:
            Image(.Backgrounds.newYorkCity)
        case .paris:
            Image(.Backgrounds.paris)
        case .richGuysHouse:
            Image(.Backgrounds.richGuysHouse)
        case .singapore:
            Image(.Backgrounds.singapore)
        case .skyscraper:
            Image(.Backgrounds.skyscraper)
        case .streetCorner:
            Image(.Backgrounds.streetCorner)
        case .streetCornerDark:
            Image(.Backgrounds.streetCornerDark)
        case .tokyo:
            Image(.Backgrounds.tokyo)
        case .trench:
            Image(.Backgrounds.trench)
        case .vegas:
            Image(.Backgrounds.vegas)
        }
    }
    
    public var url: URL? {
        switch self {
        case .alps:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984762/alps_uhv26s.jpg")
        case .basketballGym:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984764/basketball_gym_ypirkr.jpg")
        case .beach:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984757/beach_eoiyat.jpg")
        case .basement:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984755/basement_qfpyeg.jpg")
        case .campout:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984759/campout_e33o3r.jpg")
        case .classroom:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984760/classroom_za0fqt.jpg")
        case .coffeeShop:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984755/coffee_shop_y2pecz.jpg")
        case .dojo:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984758/dojo_qymwqh.jpg")
        case .dubai:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984768/dubai_io3hyf.jpg")
        case .garage:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984770/garage_gkjg7y.jpg")
        case .garden:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984763/garden_kynbap.jpg")
        case .highclere:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1746280045/highclere_mtieus.jpg")
        case .kitchen:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984761/kitchen_zo8qnf.jpg")
        case .library:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1746283944/library_svw4te.png")
        case .london:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984771/london_fpvez1.jpg")
        case .lumberYard:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1746271494/lumber_yard_y2gms6.jpg")
        case .mexico:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984772/mexico_klmlly.jpg")
        case .newYorkCity:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984774/newYorkCity_p2mhqa.jpg")
        case .paris:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984775/paris_evseyh.jpg")
        case .richGuysHouse:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984776/richGuysHouse_dpntvv.jpg")
        case .singapore:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984778/singapore_ewbk07.jpg")
        case .skyscraper:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1746271494/skyscraper_lxv9ug.jpg")
        case .streetCorner:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1746271494/street_corner_q42ivv.jpg")
        case .streetCornerDark:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1746271494/street_corner_dark_aejp6y.jpg")
        case .tokyo:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984779/tokyo_szsv6c.jpg")
        case .trench:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1746271494/trench_usjoui.jpg")
        case .vegas:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984780/vegas_mslhfk.jpg")
        }
    }
}
