import Foundation

public struct FamousBot: Decodable, Equatable, Sendable {
    public let id: FamousBotID
    public let displayName: String
    public let fullName: String
    public let bio: String
    public let imageURL: URL?
    public let wikipediaURL: URL?
    
    public enum FamousBotID: String, Decodable, Sendable {
        case adamSmith = "smith"
        case bach = "bach"
        case beethoven = "beethoven"
        case chopin = "chopin"
        case burke = "burke"
        case coase = "coase"
        case friedman = "friedman"
        case dostoevsky = "dostoevsky"
        case hume = "hume"
        case hayek = "hayek"
        case jobs = "jobs"
        case epstein = "epstein"
        case mozart = "mozart"
        case schumpeter = "schumpeter"
        case roberts = "roberts"
        case ozu = "ozu"
        case mizoguchi = "mizoguchi"
        case kurosawa = "kurosawa"
        case thoburn = "thoburn"
        case nozick = "nozick"
        case cantor = "cantor"
        case setsukoHara = "setsuko_hara"
        case chishuRyu = "chishu_ryu"
        case alexander = "alexander"
        case seneca = "seneca"
        case woolf = "woolf"
        case tesla = "tesla"
        case dickinson = "dickinson"
        case goya = "goya"
        case kierkegaard = "kierkegaard"
        case alhazen = "alhazen"
        case coltrane = "coltrane"
        case hugo = "hugo"
        case austen = "austen"
        case argerich = "argerich"
        case pascal = "pascal"
        case descartes = "descartes"
        case hawthorne = "hawthorne"
        case copernicus = "copernicus"
        case janeJacobs = "jacobs"
        case plato = "plato"
        case vermeer = "vermeer"
        case cage = "cage"
        case gibbon = "gibbon"
        case ives = "ives"
        case copland = "copland"
        case curry = "curry"
        case stockton = "stockton"
        case kant = "kant"
    }
    
    public static func loadAll() -> [FamousBot] {
        [
            .adamSmith,
            .bach,
            .beethoven,
            .chopin,
            .burke,
            .coase,
            .friedman,
            .dostoevsky,
            .hume,
            .hayek,
            .jobs,
            .epstein,
            .mozart,
            .schumpeter,
            .roberts,
            .ozu,
            .mizoguchi,
            .kurosawa,
            .thoburn,
            .nozick,
            .cantor,
            .setsukoHara,
            .chishuRyu,
            .alexander,
            .seneca,
            .woolf,
            .tesla,
            .dickinson,
            .goya,
            .kierkegaard,
            .alhazen,
            .coltrane,
            .hugo,
            .austen,
            .argerich,
            .pascal,
            .descartes,
            .hawthorne,
            .copernicus,
            .janeJacobs,
            .plato,
            .vermeer,
            .cage,
            .gibbon,
            .ives,
            .copland,
//            .curry,
//            .stockton,
            .kant,
        ]
    }
    
    public static func unique(count: Int) -> [FamousBot] {
        let allBots: [FamousBot] = loadAll().shuffled()
        return Array(allBots.prefix(min(count, allBots.count)))
    }
    
    public static func new(
        thatDoesntExistIn existingIDs: Set<FamousBotID>
    ) -> FamousBot {
        loadAll().first(where: { bot in
            !existingIDs.contains(bot.id)
        }) ?? .adamSmith
    }
    
    public static var copland: FamousBot {
        .init(
            id: .copland,
            displayName: "Copland",
            fullName: "Aaron Copland",
            bio: "American composer who defined a distinctly American sound with open harmonies and folk influences in works like _Appalachian Spring_, _Fanfare for the Common Man_, and _Rodeo_.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760894/copland_xxe63f.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Aaron_Copland")
        )
    }

    public static var ives: FamousBot {
        .init(
            id: .ives,
            displayName: "Ives",
            fullName: "Charles Ives",
            bio: "American modernist composer known for his innovative use of dissonance, polytonality, and collage techniques in works that reflected American life and spirit.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760895/ives_qkk1aw.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Charles_Ives")
        )
    }

    public static var pascal: FamousBot {
        .init(
            id: .pascal,
            displayName: "Pascal",
            fullName: "Blaise Pascal",
            bio: "French mathematician, physicist, and philosopher known for his work on probability theory, fluid mechanics, and existential theology.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760900/pascal_yn0lle.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Blaise_Pascal")
        )
    }

    public static var descartes: FamousBot {
        .init(
            id: .descartes,
            displayName: "Descartes",
            fullName: "René Descartes",
            bio: "French philosopher and mathematician famous for _Cogito, ergo sum_ and his foundational role in modern Western philosophy and analytic geometry.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760888/descartes_wum5ju.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/René_Descartes")
        )
    }

    public static var hawthorne: FamousBot {
        .init(
            id: .hawthorne,
            displayName: "Hawthorne",
            fullName: "Nathaniel Hawthorne",
            bio: "American novelist and short story writer known for exploring themes of sin and morality in works like _The Scarlet Letter_ and _The House of the Seven Gables_.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760898/hawthorne_w5bf0r.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Nathaniel_Hawthorne")
        )
    }

    public static var copernicus: FamousBot {
        .init(
            id: .copernicus,
            displayName: "Copernicus",
            fullName: "Nicolaus Copernicus",
            bio: "Renaissance polymath who formulated a heliocentric model of the universe, revolutionizing astronomy and challenging geocentric orthodoxy.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760899/copernicus_jxcric.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Nicolaus_Copernicus")
        )
    }

    public static var janeJacobs: FamousBot {
        .init(
            id: .janeJacobs,
            displayName: "Jacobs",
            fullName: "Jane Jacobs",
            bio: "Urban theorist and activist whose book _The Death and Life of Great American Cities_ transformed urban planning with its emphasis on community and organic design.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760892/jane_jacobs_rpabdu.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Jane_Jacobs")
        )
    }

    public static var plato: FamousBot {
        .init(
            id: .plato,
            displayName: "Plato",
            fullName: "Plato",
            bio: "Classical Greek philosopher, student of Socrates and teacher of Aristotle, whose dialogues shaped Western thought on politics, ethics, and metaphysics.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760906/plato_m5nzsg.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Plato")
        )
    }

    public static var vermeer: FamousBot {
        .init(
            id: .vermeer,
            displayName: "Vermeer",
            fullName: "Johannes Vermeer",
            bio: "Dutch Baroque painter known for his masterful treatment of light and serene domestic scenes like _Girl with a Pearl Earring_.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760886/vermeer_qoiaf4.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Johannes_Vermeer")
        )
    }

    public static var cage: FamousBot {
        .init(
            id: .cage,
            displayName: "Cage",
            fullName: "John Cage",
            bio: "American avant-garde composer and theorist known for _4′33″_ and pioneering chance-based music and experimental sound practices.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760893/john_cage_fna41i.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/John_Cage")
        )
    }

    public static var gibbon: FamousBot {
        .init(
            id: .gibbon,
            displayName: "Gibbon",
            fullName: "Edward Gibbon",
            bio: "English historian best known for _The History of the Decline and Fall of the Roman Empire_, a foundational text in historical writing.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760886/gibbons_zfrehy.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Edward_Gibbon")
        )
    }

    
    public static var argerich: FamousBot {
        .init(
            id: .argerich,
            displayName: "Argerich",
            fullName: "Martha Argerich",
            bio: "Argentine pianist celebrated for her passionate, virtuosic performances and deep interpretations of Romantic and 20th-century repertoire.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752752568/argerich_nehcld.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Martha_Argerich")
        )
    }
    
    public static var austen: FamousBot {
        .init(
            id: .austen,
            displayName: "Austen",
            fullName: "Jane Austen",
            bio: "English novelist known for her sharp social commentary and timeless works such as _Pride and Prejudice_, _Emma_, and _Sense and Sensibility_.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752752570/austen_qyhzvv.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Jane_Austen")
        )
    }
    
    public static var seneca: FamousBot {
        .init(
            id: .seneca,
            displayName: "Seneca",
            fullName: "Lucius Annaeus Seneca",
            bio: "Roman Stoic philosopher, playwright, and statesman whose writings on ethics, self-control, and resilience have influenced generations.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760901/seneca_u4auqf.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Seneca_the_Younger")
        )
    }

    public static var woolf: FamousBot {
        .init(
            id: .woolf,
            displayName: "Woolf",
            fullName: "Virginia Woolf",
            bio: "English writer and modernist pioneer, known for novels like _Mrs Dalloway_ and _To the Lighthouse_ and for her stream-of-consciousness narrative style.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760889/woolf_m2a4hl.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Virginia_Woolf")
        )
    }

    public static var tesla: FamousBot {
        .init(
            id: .tesla,
            displayName: "Tesla",
            fullName: "Nikola Tesla",
            bio: "Serbian-American inventor and futurist best known for his work with electricity, including the AC current system and Tesla coil.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760904/tesla_fs60in.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Nikola_Tesla")
        )
    }

    public static var dickinson: FamousBot {
        .init(
            id: .dickinson,
            displayName: "Dickinson",
            fullName: "Emily Dickinson",
            bio: "American poet known for her unique, compressed verse and introspective exploration of death, nature, and consciousness.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760885/dickinson_bbgrr2.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Emily_Dickinson")
        )
    }

    public static var goya: FamousBot {
        .init(
            id: .goya,
            displayName: "Goya",
            fullName: "Francisco Goya",
            bio: "Spanish painter and printmaker whose works span from court portraits to dark, haunting explorations of war and madness.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760904/goya_aprc72.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Francisco_Goya")
        )
    }

    public static var kierkegaard: FamousBot {
        .init(
            id: .kierkegaard,
            displayName: "Kierkegaard",
            fullName: "Søren Kierkegaard",
            bio: "Danish philosopher and theologian considered the father of existentialism, known for his critiques of Hegel and exploration of faith and individuality.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760902/kierkegaard_kxpjnv.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/S%C3%B8ren_Kierkegaard")
        )
    }

    public static var alhazen: FamousBot {
        .init(
            id: .alhazen,
            displayName: "Alhazen",
            fullName: "Ibn al-Haytham",
            bio: "Medieval Arab polymath whose pioneering work in optics laid the foundation for the scientific method and modern physics.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760890/haytham_encrqx.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Alhazen")
        )
    }

    public static var coltrane: FamousBot {
        .init(
            id: .coltrane,
            displayName: "Coltrane",
            fullName: "John Coltrane",
            bio: "American jazz saxophonist and composer known for pushing the boundaries of the genre with spiritually inspired, improvisational mastery.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760896/coltrane_fzchxg.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/John_Coltrane")
        )
    }

    public static var hugo: FamousBot {
        .init(
            id: .hugo,
            displayName: "Hugo",
            fullName: "Victor Hugo",
            bio: "French poet, novelist, and dramatist of the Romantic era, celebrated for works like _Les Misérables_ and _The Hunchback of Notre-Dame_.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760963/hugo_rvem9n.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Victor_Hugo")
        )
    }

    public static var kant: FamousBot {
        .init(
            id: .kant,
            displayName: "Kant",
            fullName: "Immanuel Kant",
            bio: "German Enlightenment philosopher whose work in epistemology and ethics—especially the _Critique of Pure Reason_ and the concept of the categorical imperative—profoundly shaped modern philosophy.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760891/kant_ottke2.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Immanuel_Kant")
        )
    }

    public static var chishuRyu: FamousBot {
        .init(
            id: .chishuRyu,
            displayName: "Ryū",
            fullName: "Chishū Ryū",
            bio: "Legendary Japanese actor celebrated for his frequent collaborations with director Yasujirō Ozu, appearing in classics like _Tokyo Story_ and _Late Spring_, embodying quiet strength and humility.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752762185/ryu_gdkcrc.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Chish%C5%AB_Ry%C5%AB")
        )
    }
    
    public static var setsukoHara: FamousBot {
        .init(
            id: .setsukoHara,
            displayName: "Hara",
            fullName: "Setsuko Hara",
            bio: "Iconic Japanese actress known for her work with director Yasujirō Ozu, especially in films like _Tokyo Story_, where she embodied grace, resilience, and postwar modernity.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752762555/hara_qftuz7.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Setsuko_Hara")
        )
    }
    
    public static var adamSmith: FamousBot {
        .init(
            id: .adamSmith,
            displayName: "Smith",
            fullName: "Adam Smith",
            bio: "Scottish economist and philosopher, best known for _The Wealth of Nations_ and as the father of modern economics.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984692/adam_smith_qsbeem.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Adam_Smith")
        )
    }

    public static var bach: FamousBot {
        .init(
            id: .bach,
            displayName: "Bach",
            fullName: "Johann Sebastian Bach",
            bio: "German composer and musician of the Baroque period, renowned for works like the Brandenburg Concertos and the Mass in B minor.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984700/bach_qqfavj.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Johann_Sebastian_Bach")
        )
    }

    public static var beethoven: FamousBot {
        .init(
            id: .beethoven,
            displayName: "Beethoven",
            fullName: "Ludwig van Beethoven",
            bio: "German composer and pianist who bridged the Classical and Romantic eras; known for symphonies, piano concertos, and string quartets.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984693/beethoven_bspgg0.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Ludwig_van_Beethoven")
        )
    }

    public static var chopin: FamousBot {
        .init(
            id: .chopin,
            displayName: "Chopin",
            fullName: "Frédéric Chopin",
            bio: "Polish composer and virtuoso pianist of the Romantic era, known for his solo piano compositions and poetic style.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984694/chopin_lv4gv9.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Frédéric_Chopin")
        )
    }

    public static var burke: FamousBot {
        .init(
            id: .burke,
            displayName: "Burke",
            fullName: "Edmund Burke",
            bio: "Irish statesman and philosopher known for his support of the American colonies and criticism of the French Revolution.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984694/burke_wt7bvb.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Edmund_Burke")
        )
    }

    public static var coase: FamousBot {
        .init(
            id: .coase,
            displayName: "Coase",
            fullName: "Ronald Coase",
            bio: "British economist and author of _The Nature of the Firm_ and _The Problem of Social Cost_; key figure in law and economics.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984695/coase_sovclf.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Ronald_Coase")
        )
    }

    public static var curry: FamousBot {
        .init(
            id: .curry,
            displayName: "Curry",
            fullName: "Stephen Curry",
            bio: "American professional basketball player widely regarded as the greatest shooter in NBA history and a two-time MVP.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984696/curry_zyhbnt.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Stephen_Curry")
        )
    }

    public static var friedman: FamousBot {
        .init(
            id: .friedman,
            displayName: "Friedman",
            fullName: "Milton Friedman",
            bio: "American economist and statistician who championed free-market capitalism and won the Nobel Prize in Economic Sciences in 1976.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984697/friedman_oxtkbx.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Milton_Friedman")
        )
    }

    public static var dostoevsky: FamousBot {
        .init(
            id: .dostoevsky,
            displayName: "Dostoevsky",
            fullName: "Fyodor Dostoevsky",
            bio: "Russian novelist and philosopher known for exploring psychology and existentialism in works like _Crime and Punishment_ and _The Brothers Karamazov_.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984696/dostoevsky_osdpqt.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Fyodor_Dostoevsky")
        )
    }

    public static var hume: FamousBot {
        .init(
            id: .hume,
            displayName: "Hume",
            fullName: "David Hume",
            bio: "Scottish Enlightenment philosopher, historian, and economist, known for his empirical approach and skepticism.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984699/hume_stamlo.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/David_Hume")
        )
    }

    public static var hayek: FamousBot {
        .init(
            id: .hayek,
            displayName: "Hayek",
            fullName: "Friedrich Hayek",
            bio: "Austrian-British economist and philosopher best known for his defense of classical liberalism and his book _The Road to Serfdom_.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984698/hayek_cl3q4t.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Friedrich_Hayek")
        )
    }

    public static var jobs: FamousBot {
        .init(
            id: .jobs,
            displayName: "Jobs",
            fullName: "Steve Jobs",
            bio: "American entrepreneur and co-founder of Apple Inc., known for revolutionizing personal computing, music, and mobile phones.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984700/jobs_pabvsb.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Steve_Jobs")
        )
    }

    public static var epstein: FamousBot {
        .init(
            id: .epstein,
            displayName: "Epstein",
            fullName: "Richard Epstein",
            bio: "American legal scholar known for his work on law and economics, classical liberalism, and the role of regulation.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984703/richard_epstein_pdfv4s.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Richard_Epstein")
        )
    }

    public static var mozart: FamousBot {
        .init(
            id: .mozart,
            displayName: "Mozart",
            fullName: "Wolfgang Amadeus Mozart",
            bio: "Austrian composer and child prodigy who created more than 600 works, including symphonies, operas, and concertos.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984702/mozart_qogvbl.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Wolfgang_Amadeus_Mozart")
        )
    }

    public static var schumpeter: FamousBot {
        .init(
            id: .schumpeter,
            displayName: "Schumpeter",
            fullName: "Joseph Schumpeter",
            bio: "Austrian political economist known for popularizing the concept of _creative destruction_ in capitalist development.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984705/schumpeter_xc7shh.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Joseph_Schumpeter")
        )
    }

    public static var roberts: FamousBot {
        .init(
            id: .roberts,
            displayName: "Roberts",
            fullName: "Russ Roberts",
            bio: "American economist and host of the podcast EconTalk, known for making economic ideas accessible to a broad audience.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984704/russ_roberts_gpznei.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Russ_Roberts")
        )
    }

    public static var stockton: FamousBot {
        .init(
            id: .stockton,
            displayName: "Stockton",
            fullName: "John Stockton",
            bio: "Hall of Fame NBA point guard known for his all-time records in assists and steals, and his long career with the Utah Jazz.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984706/stockton_gaunmb.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/John_Stockton")
        )
    }

    public static var ozu: FamousBot {
        .init(
            id: .ozu,
            displayName: "Ozu",
            fullName: "Yasujirō Ozu",
            bio: "Japanese film director and screenwriter known for his understated style and domestic dramas like _Tokyo Story_ that explore family and generational tensions.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984703/ozu_m8xr58.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Yasujirō_Ozu")
        )
    }

    public static var kurosawa: FamousBot {
        .init(
            id: .kurosawa,
            displayName: "Kurosawa",
            fullName: "Akira Kurosawa",
            bio: "Influential Japanese filmmaker whose epic storytelling and cinematic techniques shaped global cinema, known for classics like _Seven Samurai_ and _Rashomon_.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984700/kurosawa_bjhnin.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Akira_Kurosawa")
        )
    }

    public static var mizoguchi: FamousBot {
        .init(
            id: .mizoguchi,
            displayName: "Mizoguchi",
            fullName: "Kenji Mizoguchi",
            bio: "Japanese director renowned for long takes and social realism, often focusing on women's struggles; known for films like _Ugetsu_ and _The Life of Oharu_.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984702/mizoguchi_f4bbhl.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Kenji_Mizoguchi")
        )
    }

    public static var thoburn: FamousBot {
        .init(
            id: .thoburn,
            displayName: "Thoburn",
            fullName: "David Thoburn",
            bio: "Literature professor at MIT known for his engaging teaching style and contributions to classical and comparative literature studies.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1746280044/thoburn_dxlcpa.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/David_Thorburn_(scholar)")
        )
    }

    public static var nozick: FamousBot {
        .init(
            id: .nozick,
            displayName: "Nozick",
            fullName: "Robert Nozick",
            bio: "American philosopher best known for _Anarchy, State, and Utopia,_ a libertarian response to Rawls' theory of justice.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1746280098/nozick_l4qsnk.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Robert_Nozick")
        )
    }

    public static var cantor: FamousBot {
        .init(
            id: .cantor,
            displayName: "Cantor",
            fullName: "Paul Cantor",
            bio: "American literary and cultural critic known for his work on Shakespeare, pop culture, and the intersection of literature and economics.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1746280044/cantor_wiks7y.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Paul_Cantor")
        )
    }

    public static var alexander: FamousBot {
        .init(
            id: .alexander,
            displayName: "Alexander",
            fullName: "Christopher Alexander",
            bio: "Architect and design theorist known for _A Pattern Language_ and _The Timeless Way of Building,_ emphasizing organic, human-centered design.",
            imageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1746284720/alexander_mglfr7.jpg"),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Christopher_Alexander")
        )
    }
}
