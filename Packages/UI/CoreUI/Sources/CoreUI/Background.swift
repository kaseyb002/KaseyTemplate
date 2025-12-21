import SwiftUI

public enum Background: String, Equatable, Identifiable, CaseIterable {
    case alps
    case basement
    case campout
    case classroom
    case dojo
    case garden
    case gym
    case coffeeShop
    case beach
    case garage
    case kitchen
    case newYorkCity
    case richHouse
    case mexico
    case singapore
    case dubai
    case paris
    case london
    case tokyo
    case vegas
    
    public var id: String {
        rawValue
    }
    
    public var displayTitle: String {
        switch self {
        case .alps: "Bavarian Alps"
        case .basement: "Scott's Basement"
        case .campout: "Campout"
        case .classroom: "Classroom"
        case .dojo: "Dojo"
        case .garden: "Garden"
        case .gym: "Gym"
        case .coffeeShop: "Coffee Shop"
        case .beach: "Kailua-Kona"
        case .garage: "Garage"
        case .kitchen: "Kitchen"
        case .newYorkCity: "New York City"
        case .richHouse: "Fancy House"
        case .mexico: "Mexico"
        case .singapore: "Singapore"
        case .dubai: "Dubai"
        case .paris: "Paris"
        case .london: "London"
        case .tokyo: "Tokyo"
        case .vegas: "Vegas"
        }
    }
    
    public var imageURL: URL? {
        switch self {
        case .alps:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984762/alps_uhv26s.jpg")
            
        case .basement:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984755/basement_qfpyeg.jpg")
            
        case .campout:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984759/campout_e33o3r.jpg")
            
        case .classroom:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984760/classroom_za0fqt.jpg")
            
        case .dojo:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984758/dojo_qymwqh.jpg")
            
        case .garden:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984763/garden_kynbap.jpg")
            
        case .gym:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984764/basketball_gym_ypirkr.jpg")
            
        case .coffeeShop:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984755/coffee_shop_y2pecz.jpg")
            
        case .beach:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984757/beach_eoiyat.jpg")
            
        case .garage:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984770/garage_gkjg7y.jpg")
            
        case .kitchen:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984761/kitchen_zo8qnf.jpg")
            
        case .newYorkCity:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984774/newYorkCity_p2mhqa.jpg")
            
        case .richHouse:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984776/richGuysHouse_dpntvv.jpg")
            
        case .mexico:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984772/mexico_klmlly.jpg")
            
        case .singapore:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984778/singapore_ewbk07.jpg")
            
        case .dubai:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984768/dubai_io3hyf.jpg")
            
        case .paris:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984775/paris_evseyh.jpg")
            
        case .london:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984771/london_fpvez1.jpg")
            
        case .tokyo:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984779/tokyo_szsv6c.jpg")
            
        case .vegas:
            URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984780/vegas_mslhfk.jpg")
        }
    }
}
