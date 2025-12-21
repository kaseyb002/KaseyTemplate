import Foundation
import Extensions

public struct BotSourceData: Sendable {
    public let name: String
    public let style: Style
    public let imageURL: URL
}

public enum Style: Sendable {
    case wild
    case aggressive
    case tight
    case average
}

public let botDatabase: [String: BotSourceData] = [
    "1": .init(
        name: "James",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=1")!
    ),
    "2": .init(
        name: "Mary",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=2")!
    ),
    "3": .init(
        name: "John",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=3")!
    ),
    "4": .init(
        name: "Eugene",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=200")!
    ),
    "5": .init(
        name: "Susan",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=201")!
    ),
    "6": .init(
        name: "Richard",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=202")!
    ),
    "7": .init(
        name: "Emily",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=203")!
    ),
    "8": .init(
        name: "Charles",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=204")!
    ),
    "9": .init(
        name: "Linda",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=205")!
    ),
    "10": .init(
        name: "Robert",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=206")!
    ),
    "11": .init(
        name: "Jennifer",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=207")!
    ),
    "12": .init(
        name: "William",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=208")!
    ),
    "13": .init(
        name: "Patricia",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=209")!
    ),
    "14": .init(
        name: "Liam",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=1")!
    ),
    "15": .init(
        name: "Olivia",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=2")!
    ),
    "16": .init(
        name: "Noah",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=3")!
    ),
    "17": .init(
        name: "Ava",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=4")!
    ),
    "18": .init(
        name: "Elijah",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=5")!
    ),
    "19": .init(
        name: "Mia",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=6")!
    ),
    "20": .init(
        name: "Liam",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=7")!
    ),
    "21": .init(
        name: "Sophia",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=8")!
    ),
    "22": .init(
        name: "Lucas",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=9")!
    ),
    "23": .init(
        name: "Luna",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=10")!
    ),
    "24": .init(
        name: "Ethan",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=11")!
    ),
    "25": .init(
        name: "Charlotte",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=12")!
    ),
    "26": .init(
        name: "Oliver",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=13")!
    ),
    "27": .init(
        name: "Amelia",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=14")!
    ),
    "28": .init(
        name: "Elijah",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=15")!
    ),
    "29": .init(
        name: "Harper",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=16")!
    ),
    "30": .init(
        name: "Benjamin",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=17")!
    ),
    "31": .init(
        name: "Evelyn",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=18")!
    ),
    "32": .init(
        name: "William",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=19")!
    ),
    "33": .init(
        name: "Aria",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=20")!
    ),
    "34": .init(
        name: "Louis",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=21")!
    ),
    "35": .init(
        name: "Camille",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=22")!
    ),
    "36": .init(
        name: "Gabriel",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=23")!
    ),
    "37": .init(
        name: "Chloe",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=24")!
    ),
    "38": .init(
        name: "Raphael",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=25")!
    ),
    "39": .init(
        name: "Zoé",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=26")!
    ),
    "40": .init(
        name: "Leo",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=27")!
    ),
    "41": .init(
        name: "Amélie",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=28")!
    ),
    "42": .init(
        name: "Maxime",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=29")!
    ),
    "43": .init(
        name: "Julia",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=30")!
    ),
    "44": .init(
        name: "Remy",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=31")!
    ),
    "45": .init(
        name: "Luc",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=33")!
    ),
    "46": .init(
        name: "Léa",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=34")!
    ),
    "47": .init(
        name: "Nathan",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=35")!
    ),
    "48": .init(
        name: "Wei",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=36")!
    ),
    "49": .init(
        name: "Li",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=37")!
    ),
    "50": .init(
        name: "Xia",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=38")!
    ),
    "51": .init(
        name: "Yuan",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=39")!
    ),
    "52": .init(
        name: "Ming",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=40")!
    ),
    "53": .init(
        name: "Jing",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=41")!
    ),
    "54": .init(
        name: "Ling",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=42")!
    ),
    "55": .init(
        name: "Chen",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=43")!
    ),
    "56": .init(
        name: "Xuan",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=44")!
    ),
    "57": .init(
        name: "Xiao",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=45")!
    ),
    "58": .init(
        name: "Yuki",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=46")!
    ),
    "59": .init(
        name: "Haru",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=47")!
    ),
    "60": .init(
        name: "Sora",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=48")!
    ),
    "61": .init(
        name: "Akira",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=49")!
    ),
    "62": .init(
        name: "Hana",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=50")!
    ),
    "63": .init(
        name: "Ren",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=51")!
    ),
    "64": .init(
        name: "Kaito",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=52")!
    ),
    "65": .init(
        name: "Riko",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=53")!
    ),
    "66": .init(
        name: "Yumi",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=54")!
    ),
    "67": .init(
        name: "Taro",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=55")!
    ),
    "68": .init(
        name: "Alejandro",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=56")!
    ),
    "69": .init(
        name: "Sofia",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=57")!
    ),
    "70": .init(
        name: "Diego",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=58")!
    ),
    "71": .init(
        name: "Valentina",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=59")!
    ),
    "72": .init(
        name: "Luis",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=60")!
    ),
    "73": .init(
        name: "Camila",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=61")!
    ),
    "74": .init(
        name: "Carlos",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=62")!
    ),
    "75": .init(
        name: "Mariana",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=63")!
    ),
    "76": .init(
        name: "Javier",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=64")!
    ),
    "77": .init(
        name: "Isabella",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=65")!
    ),
    "78": .init(
        name: "Kwame",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=66")!
    ),
    "79": .init(
        name: "Amina",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=67")!
    ),
    "80": .init(
        name: "Chinwe",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=68")!
    ),
    "81": .init(
        name: "Thabo",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=69")!
    ),
    "82": .init(
        name: "Musa",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=70")!
    ),
    "83": .init(
        name: "Sekai",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=71")!
    ),
    "84": .init(
        name: "Mamadou",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=72")!
    ),
    "85": .init(
        name: "Nia",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=73")!
    ),
    "86": .init(
        name: "Fatoumata",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=74")!
    ),
    "87": .init(
        name: "Chinedu",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=75")!
    ),
    "88": .init(
        name: "Ivan",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=76")!
    ),
    "89": .init(
        name: "Elena",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=77")!
    ),
    "90": .init(
        name: "Nikolai",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=78")!
    ),
    "91": .init(
        name: "Anastasia",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=79")!
    ),
    "92": .init(
        name: "Dmitri",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=80")!
    ),
    "93": .init(
        name: "Sofia",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=81")!
    ),
    "94": .init(
        name: "Viktor",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=82")!
    ),
    "95": .init(
        name: "Katarina",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=83")!
    ),
    "96": .init(
        name: "Aleksandr",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=84")!
    ),
    "97": .init(
        name: "Ekaterina",
        style: .aggressive,
        imageURL: URL(string: "https://picsum.photos/200/200?random=85")!
    ),
    "98": .init(
        name: "Mikhail",
        style: .average,
        imageURL: URL(string: "https://picsum.photos/200/200?random=86")!
    ),
    "99": .init(
        name: "Anya",
        style: .tight,
        imageURL: URL(string: "https://picsum.photos/200/200?random=87")!
    ),
    "100": .init(
        name: "Vladimir",
        style: .wild,
        imageURL: URL(string: "https://picsum.photos/200/200?random=88")!
    ),
]

/*
 internal let botData: [BotSourceData] = [
 .init(
 name: "James",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=1")!
 ),
 .init(
 name: "Mary",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=2")!
 ),
 .init(
 name: "John",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=3")!
 ),
 .init(
 name: "Eugene",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=200")!
 ),
 .init(
 name: "Susan",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=201")!
 ),
 .init(
 name: "Richard",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=202")!
 ),
 .init(
 name: "Emily",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=203")!
 ),
 .init(
 name: "Charles",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=204")!
 ),
 .init(
 name: "Linda",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=205")!
 ),
 .init(
 name: "Robert",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=206")!
 ),
 .init(
 name: "Jennifer",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=207")!
 ),
 .init(
 name: "William",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=208")!
 ),
 .init(
 name: "Patricia",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=209")!
 ),
 .init(
 name: "Liam",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=1")!
 ),
 .init(
 name: "Olivia",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=2")!
 ),
 .init(
 name: "Noah",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=3")!
 ),
 .init(
 name: "Ava",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=4")!
 ),
 .init(
 name: "Elijah",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=5")!
 ),
 .init(
 name: "Mia",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=6")!
 ),
 .init(
 name: "Liam",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=7")!
 ),
 .init(
 name: "Sophia",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=8")!
 ),
 .init(
 name: "Lucas",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=9")!
 ),
 .init(
 name: "Luna",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=10")!
 ),
 .init(
 name: "Ethan",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=11")!
 ),
 .init(
 name: "Charlotte",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=12")!
 ),
 .init(
 name: "Oliver",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=13")!
 ),
 .init(
 name: "Amelia",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=14")!
 ),
 .init(
 name: "Elijah",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=15")!
 ),
 .init(
 name: "Harper",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=16")!
 ),
 .init(
 name: "Benjamin",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=17")!
 ),
 .init(
 name: "Evelyn",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=18")!
 ),
 .init(
 name: "William",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=19")!
 ),
 .init(
 name: "Aria",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=20")!
 ),
 .init(
 name: "Louis",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=21")!
 ),
 .init(
 name: "Camille",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=22")!
 ),
 .init(
 name: "Gabriel",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=23")!
 ),
 .init(
 name: "Chloe",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=24")!
 ),
 .init(
 name: "Raphael",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=25")!
 ),
 .init(
 name: "Zoé",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=26")!
 ),
 .init(
 name: "Leo",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=27")!
 ),
 .init(
 name: "Amélie",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=28")!
 ),
 .init(
 name: "Maxime",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=29")!
 ),
 .init(
 name: "Julia",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=30")!
 ),
 .init(
 name: "Remy",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=31")!
 ),
 .init(
 name: "Luc",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=33")!
 ),
 .init(
 name: "Léa",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=34")!
 ),
 .init(
 name: "Nathan",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=35")!
 ),
 .init(
 name: "Wei",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=36")!
 ),
 .init(
 name: "Li",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=37")!
 ),
 .init(
 name: "Xia",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=38")!
 ),
 .init(
 name: "Yuan",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=39")!
 ),
 .init(
 name: "Ming",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=40")!
 ),
 .init(
 name: "Jing",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=41")!
 ),
 .init(
 name: "Ling",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=42")!
 ),
 .init(
 name: "Chen",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=43")!
 ),
 .init(
 name: "Xuan",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=44")!
 ),
 .init(
 name: "Xiao",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=45")!
 ),
 .init(
 name: "Yuki",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=46")!
 ),
 .init(
 name: "Haru",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=47")!
 ),
 .init(
 name: "Sora",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=48")!
 ),
 .init(
 name: "Akira",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=49")!
 ),
 .init(
 name: "Hana",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=50")!
 ),
 .init(
 name: "Ren",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=51")!
 ),
 .init(
 name: "Kaito",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=52")!
 ),
 .init(
 name: "Riko",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=53")!
 ),
 .init(
 name: "Yumi",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=54")!
 ),
 .init(
 name: "Taro",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=55")!
 ),
 .init(
 name: "Alejandro",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=56")!
 ),
 .init(
 name: "Sofia",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=57")!
 ),
 .init(
 name: "Diego",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=58")!
 ),
 .init(
 name: "Valentina",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=59")!
 ),
 .init(
 name: "Luis",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=60")!
 ),
 .init(
 name: "Camila",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=61")!
 ),
 .init(
 name: "Carlos",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=62")!
 ),
 .init(
 name: "Mariana",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=63")!
 ),
 .init(
 name: "Javier",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=64")!
 ),
 .init(
 name: "Isabella",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=65")!
 ),
 .init(
 name: "Kwame",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=66")!
 ),
 .init(
 name: "Amina",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=67")!
 ),
 .init(
 name: "Chinwe",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=68")!
 ),
 .init(
 name: "Thabo",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=69")!
 ),
 .init(
 name: "Musa",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=70")!
 ),
 .init(
 name: "Sekai",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=71")!
 ),
 .init(
 name: "Mamadou",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=72")!
 ),
 .init(
 name: "Nia",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=73")!
 ),
 .init(
 name: "Fatoumata",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=74")!
 ),
 .init(
 name: "Chinedu",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=75")!
 ),
 .init(
 name: "Ivan",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=76")!
 ),
 .init(
 name: "Elena",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=77")!
 ),
 .init(
 name: "Alexei",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=78")!
 ),
 .init(
 name: "Anastasia",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=79")!
 ),
 .init(
 name: "Dmitri",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=80")!
 ),
 .init(
 name: "Natalia",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=81")!
 ),
 .init(
 name: "Sergei",
 style: .average,
 imageURL: URL(string: "https://picsum.photos/200/200?random=82")!
 ),
 .init(
 name: "Yulia",
 style: .tight,
 imageURL: URL(string: "https://picsum.photos/200/200?random=83")!
 ),
 .init(
 name: "Mikhail",
 style: .wild,
 imageURL: URL(string: "https://picsum.photos/200/200?random=84")!
 ),
 .init(
 name: "Ekaterina",
 style: .aggressive,
 imageURL: URL(string: "https://picsum.photos/200/200?random=85")!
 )
 ]
 
 
 */
