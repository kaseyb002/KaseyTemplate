import Foundation

/// Provides access to all iOS emojis with search functionality
public enum EmojiProvider: Sendable {
    /// Tags for emoji search. Maps emoji to a set of searchable tags
    public static let emojiTags: [String: Set<String>] = [
        // Popular emojis with comprehensive tags
        "❤️": ["love", "heart", "red", "romance", "like", "favorite", "valentine"],
        "😂": ["laugh", "laughing", "funny", "cry", "tears", "joy", "happy", "haha", "lol"],
        "👍": ["thumbs", "up", "good", "yes", "approve", "like", "ok", "okay", "agree", "positive"],
        "😮": ["surprised", "surprise", "shock", "wow", "oh", "amazed", "astonished", "open", "mouth"],
        "🙏": ["pray", "prayer", "thank", "thanks", "please", "hands", "folded", "namaste", "grateful", "blessing"],
        "🔥": ["fire", "hot", "lit", "flame", "burning", "awesome", "amazing", "trending"],
        "👏": ["clap", "clapping", "applause", "bravo", "congrats", "congratulations", "praise", "hands"],
        "💯": ["hundred", "100", "perfect", "score", "century", "complete", "full"],
        "🎉": ["party", "celebration", "celebrate", "congrats", "tada", "confetti", "festive", "cheers"],
        "😍": ["love", "heart", "eyes", "adore", "crush", "infatuated", "attractive", "beautiful"],
        "🤔": ["think", "thinking", "ponder", "consider", "wonder", "hmm", "question", "curious"],
        "😎": ["cool", "sunglasses", "shades", "smooth", "awesome", "chill", "relaxed", "stylish"],
        "😱": ["scream", "shocked", "terrified", "horror", "fear", "scared", "surprised", "wow"],
        "🤯": ["mind", "blown", "explode", "amazed", "shocked", "brain", "mindblown", "wow"],
        "💪": ["muscle", "strong", "power", "flex", "bicep", "workout", "fitness", "strength", "tough"],
        "🤑": ["money", "rich", "cash", "dollar", "wealthy", "greedy", "profit", "dollar", "bill"],
        "✨": ["sparkle", "star", "magic", "shiny", "glitter", "sparkles", "twinkle", "special"],
        "🎯": ["target", "dart", "bullseye", "aim", "goal", "accurate", "on", "point", "direct"],
        "😭": ["cry", "crying", "sad", "tears", "sob", "weep", "upset", "unhappy", "emotional"],
        "😡": ["angry", "mad", "rage", "furious", "annoyed", "irritated", "frustrated", "upset"],
        "🚀": ["rocket", "launch", "space", "fast", "speed", "blast", "off", "zoom", "quick"],
        "😄": ["smile", "happy", "grin", "joy", "cheerful", "glad", "pleased", "delighted"],
        "😊": ["smile", "happy", "blush", "pleased", "content", "satisfied", "glad", "cheerful"],
        "🥰": ["love", "smile", "hearts", "adore", "affection", "romantic", "cute", "sweet"],
        
        // Additional common emojis
        "😢": ["sad", "cry", "tears", "unhappy", "upset", "depressed", "sorrow"],
        "👎": ["thumbs", "down", "bad", "no", "dislike", "disapprove", "negative", "wrong"],
        "😘": ["kiss", "kissing", "love", "lips", "romantic", "affection", "xoxo", "blow"],
        "😉": ["wink", "winking", "playful", "flirt", "tease", "joke", "hint"],
        "😇": ["angel", "halo", "innocent", "good", "saint", "pure", "holy"],
        "🤗": ["hug", "hugging", "embrace", "comfort", "support", "care", "arms"],
        "🙃": ["upside", "down", "silly", "playful", "flip", "reverse", "joke"],
        "🙂": ["slight", "smile", "neutral", "calm", "content", "mild", "pleasant"],
        "🤩": ["star", "eyes", "excited", "amazed", "fancy", "glamour", "wow"],
        "🥳": ["party", "celebration", "birthday", "hat", "confetti", "festive", "cheer"],
        "😏": ["smirk", "smirking", "sly", "cunning", "mischievous", "knowing", "wink"],
        "😴": ["sleep", "sleeping", "tired", "zzz", "nap", "rest", "bed"],
        "🤤": ["drool", "drooling", "hungry", "food", "desire", "want", "crave"],
        "🤒": ["sick", "ill", "fever", "thermometer", "unwell", "temperature"],
        "🤕": ["injured", "hurt", "bandage", "head", "wound", "accident"],
        "🤢": ["nauseous", "sick", "vomit", "green", "ill", "queasy", "disgusted"],
        "🤧": ["sneeze", "sneezing", "cold", "allergy", "achoo", "sick"],
        "🥶": ["cold", "freezing", "ice", "shiver", "chill", "frozen", "blue"],
        "🥵": ["hot", "sweating", "heat", "fever", "temperature", "warm", "burning"],
        "😐": ["neutral", "expressionless", "blank", "indifferent", "meh", "whatever"],
        "😑": ["annoyed", "expressionless", "unimpressed", "bored", "flat", "deadpan"],
        "😶": ["silent", "speechless", "no", "mouth", "quiet", "mute", "blank"],
        "🙄": ["roll", "eyes", "sarcastic", "annoyed", "whatever", "eyeroll", "dismissive"],
        "😬": ["grimace", "grimacing", "awkward", "uncomfortable", "cringe", "teeth"],
        "😔": ["sad", "disappointed", "down", "depressed", "unhappy", "regret"],
        "😕": ["confused", "sad", "unsure", "worried", "frown", "disappointed"],
        "😟": ["worried", "concerned", "anxious", "frown", "uneasy", "troubled"],
        "😳": ["flushed", "embarrassed", "blush", "awkward", "shy", "red", "face"],
        "🤫": ["shush", "quiet", "secret", "whisper", "silence", "hush", "sshh"],
        "🤭": ["hand", "mouth", "surprised", "secret", "gasp", "shock", "cover"],
        "🫣": ["peek", "peeking", "eyes", "sneak", "look", "hidden", "shy"],
        "🫠": ["melt", "melting", "sweat", "hot", "drip", "liquid", "dissolve"],
        "🤐": ["zipper", "mouth", "silent", "secret", "quiet", "sealed", "closed"],
        "🤠": ["cowboy", "hat", "western", "texas", "ranch", "rodeo", "sheriff"],
        "🤡": ["clown", "joke", "funny", "silly", "circus", "comedy", "fool"],
        "👻": ["ghost", "spooky", "halloween", "scary", "spirit", "boo", "haunted"],
        "💀": ["skull", "death", "dead", "bones", "danger", "poison", "skull"],
        "👽": ["alien", "space", "ufo", "extraterrestrial", "martian", "weird", "strange"],
        "😁": ["grin", "grinning", "happy", "joy", "excited", "teeth", "wide"],
        "😆": ["laugh", "laughing", "happy", "joy", "funny", "tears", "squint"],
        "😅": ["sweat", "smile", "nervous", "relief", "awkward", "whew", "phew"],
        "🤣": ["rofl", "rolling", "floor", "laughing", "funny", "hysterical", "tears"],
        "😋": ["yum", "delicious", "tasty", "food", "lick", "tongue", "savor"],
        "😛": ["tongue", "playful", "silly", "tease", "fun", "stuck", "out"],
        "😝": ["squint", "tongue", "silly", "playful", "crazy", "fun", "wacky"],
        "🥲": ["smile", "tear", "sad", "happy", "mixed", "bittersweet", "emotional"],
        "🤪": ["zany", "crazy", "wild", "silly", "goofy", "wacky", "fun"],
        "🥴": ["woozy", "dizzy", "drunk", "confused", "spinning", "unsteady", "sick"],
        "🥹": ["tear", "holding", "back", "emotional", "touched", "grateful", "moved"],
        "😷": ["mask", "medical", "sick", "doctor", "hospital", "health", "covid"],
        "🤥": ["lying", "liar", "pinocchio", "nose", "dishonest", "fib", "untruth"],
        "😈": ["devil", "evil", "smile", "horns", "sin", "mischief", "naughty"],
        "👿": ["angry", "devil", "imp", "horns", "mad", "furious", "rage"],
        "👹": ["ogre", "monster", "japanese", "demon", "scary", "red", "mask"],
        "👺": ["goblin", "monster", "japanese", "demon", "mask", "scary", "red"],
        "🤖": ["robot", "machine", "tech", "android", "cyborg", "automation", "ai"],
        "👾": ["alien", "monster", "space", "invader", "arcade", "game", "pixel"],
        "😺": ["cat", "smile", "happy", "kitten", "pet", "cute", "grin"],
        "😸": ["cat", "grin", "happy", "joy", "kitten", "smile", "wide"],
        "😹": ["cat", "tears", "joy", "laugh", "cry", "happy", "funny"],
        "😻": ["cat", "heart", "eyes", "love", "adore", "kitten", "cute"],
        "😼": ["cat", "smirk", "sly", "wry", "smile", "kitten", "mischievous"],
        "😽": ["cat", "kiss", "kissing", "love", "kitten", "affection", "xoxo"],
        "🙀": ["cat", "surprised", "shocked", "scream", "fear", "kitten", "wow"],
        "😿": ["cat", "cry", "sad", "tears", "unhappy", "kitten", "weep"],
        "😾": ["cat", "pout", "angry", "mad", "frown", "kitten", "upset"],
        "👋": ["wave", "waving", "hand", "hello", "hi", "goodbye", "bye"],
        "🤲": ["palms", "together", "pray", "namaste", "hands", "folded", "worship"],
        "🤝": ["handshake", "deal", "agreement", "shake", "hands", "partnership", "deal"],
        "✋": ["hand", "stop", "high", "five", "palm", "halt", "wait"],
        "🖐": ["hand", "fingers", "splayed", "five", "spread", "open", "palm"],
        "🖖": ["vulcan", "salute", "star", "trek", "live", "long", "prosper"],
        "👌": ["ok", "hand", "perfect", "good", "okay", "fingers", "circle"],
        "🤌": ["pinched", "fingers", "italian", "hand", "gesture", "money", "small"],
        "🤏": ["pinching", "hand", "small", "tiny", "little", "bit", "pinch"],
        "🤞": ["crossed", "fingers", "luck", "hope", "wish", "pray", "lucky"],
        "🤟": ["love", "you", "gesture", "ily", "hand", "sign", "language"],
        "🤘": ["rock", "on", "horns", "metal", "devil", "hand", "sign"],
        "🤙": ["call", "me", "phone", "hand", "hang", "loose", "shaka"],
        "👈": ["point", "left", "finger", "direction", "back", "previous"],
        "👉": ["point", "right", "finger", "direction", "forward", "next"],
        "👆": ["point", "up", "finger", "direction", "above", "top"],
        "👇": ["point", "down", "finger", "direction", "below", "bottom"],
        "☝️": ["index", "pointing", "up", "one", "finger", "direction", "above"],
        "👊": ["fist", "punch", "power", "hit", "pound", "bump", "strength"],
        "🤛": ["fist", "left", "punch", "power", "bump", "left", "side"],
        "🤜": ["fist", "right", "punch", "power", "bump", "right", "side"],
        "🤚": ["raised", "back", "hand", "stop", "halt", "palm", "wait"],
        "✍️": ["writing", "hand", "pen", "write", "signature", "document", "ink"],
        "🙌": ["raising", "hands", "praise", "hallelujah", "celebration", "joy", "worship"],
        "👐": ["open", "hands", "welcome", "hug", "embrace", "open", "arms"],
        "🫶": ["heart", "hands", "love", "affection", "care", "support", "hug"],
        "💅": ["nail", "polish", "manicure", "beauty", "fashion", "grooming", "paint"],
        "🤳": ["selfie", "camera", "phone", "photo", "picture", "snap", "shot"],
        "🦾": ["mechanical", "arm", "prosthetic", "robot", "bionic", "tech", "cyborg"],
        "🦵": ["leg", "limb", "walk", "run", "kick", "thigh", "calf"],
        "🦶": ["foot", "toe", "walk", "step", "stomp", "sole", "heel"],
        "👣": ["footprints", "feet", "steps", "walk", "trail", "path", "track"],
        "👀": ["eyes", "look", "watch", "see", "view", "stare", "gaze"],
        "🧠": ["brain", "mind", "think", "intelligence", "smart", "thought", "head"],
        "🫀": ["anatomical", "heart", "organ", "medical", "health", "body", "cardiac"],
        "🫁": ["lungs", "breath", "breathe", "respiratory", "organ", "medical", "air"],
        "🦷": ["tooth", "teeth", "dental", "dentist", "smile", "oral", "hygiene"],
        "🦴": ["bone", "skeleton", "skull", "death", "anatomy", "medical", "calcium"],
        "👅": ["tongue", "taste", "lick", "mouth", "flavor", "speech", "oral"],
        "👄": ["lips", "mouth", "kiss", "speak", "talk", "red", "lipstick"],
        "🫦": ["biting", "lip", "nervous", "anxious", "worry", "teeth", "mouth"],
        "💋": ["kiss", "mark", "lipstick", "love", "romance", "xoxo", "seal"],
        "💘": ["heart", "arrow", "cupid", "love", "romance", "valentine", "crush"],
        "💝": ["heart", "ribbon", "gift", "present", "valentine", "love", "box"],
        "💖": ["sparkling", "heart", "love", "shiny", "glitter", "adore", "special"],
        "💗": ["growing", "heart", "love", "expand", "increase", "affection", "grow"],
        "💓": ["beating", "heart", "love", "pulse", "beat", "romance", "throb"],
        "💞": ["revolving", "hearts", "love", "romance", "spin", "twirl", "circle"],
        "💢": ["anger", "symbol", "mad", "angry", "furious", "rage", "irritated"],
        "💥": ["collision", "explosion", "bang", "crash", "impact", "boom", "pow"],
        "💫": ["dizzy", "star", "sparkle", "faint", "woozy", "confused", "spin"],
        "💦": ["sweat", "droplets", "water", "drip", "perspiration", "exercise", "hot"],
        "💨": ["dashing", "away", "wind", "fast", "speed", "quick", "zoom"],
        "🕳️": ["hole", "empty", "void", "nothing", "black", "dark", "space"],
        "⭐": ["star", "favorite", "rating", "shine", "sparkle", "night", "sky"],
        "🌟": ["glowing", "star", "shining", "bright", "sparkle", "excellent", "great"],
        "🪄": ["magic", "wand", "spell", "wizard", "fairy", "trick", "abracadabra"],
        "🌈": ["rainbow", "color", "pride", "lgbt", "lgbtq", "gay", "colors"],
        "☀️": ["sun", "sunny", "bright", "day", "weather", "hot", "summer"],
        "🌤️": ["sun", "cloud", "partly", "cloudy", "weather", "day", "sky"],
        "⛅": ["sun", "behind", "cloud", "partly", "cloudy", "weather", "overcast"],
        "🌥️": ["sun", "behind", "large", "cloud", "cloudy", "weather", "overcast"],
        "🌦️": ["sun", "behind", "rain", "cloud", "rainbow", "weather", "shower"],
        "🌧️": ["cloud", "rain", "weather", "storm", "wet", "precipitation", "shower"],
        "⛈️": ["cloud", "lightning", "rain", "storm", "thunder", "weather", "stormy"],
        "🌩️": ["cloud", "lightning", "storm", "thunder", "weather", "electric", "bolt"],
        "🌪️": ["tornado", "cyclone", "storm", "wind", "weather", "twister", "funnel"],
        "🌫️": ["fog", "mist", "cloudy", "weather", "haze", "visibility", "low"],
        "🌬️": ["wind", "face", "blow", "air", "breeze", "weather", "gust"],
        "🌀": ["cyclone", "hurricane", "typhoon", "storm", "spiral", "weather", "wind"],
        "🌊": ["water", "wave", "ocean", "sea", "beach", "surf", "tide"],
        "❄️": ["snowflake", "snow", "cold", "winter", "ice", "frost", "freeze"],
        "❤️‍🔥": ["heart", "on", "fire", "passion", "love", "burning", "hot", "intense"],
        "❤️‍🩹": ["mending", "heart", "healing", "recovery", "love", "broken", "fix"],
        "💔": ["broken", "heart", "sad", "breakup", "hurt", "pain", "love"],
        "❣️": ["heart", "exclamation", "love", "emphasis", "important", "red", "mark"],
        "💕": ["two", "hearts", "love", "romance", "couple", "affection", "hearts"],
        "💟": ["heart", "decoration", "love", "ornament", "cute", "pretty", "adornment"],
        "🧡": ["orange", "heart", "love", "affection", "warm", "autumn", "pumpkin"],
        "💛": ["yellow", "heart", "love", "friendship", "happy", "sunshine", "gold"],
        "💚": ["green", "heart", "love", "nature", "jealousy", "envy", "eco"],
        "💙": ["blue", "heart", "love", "calm", "peace", "ocean", "sky"],
        "💜": ["purple", "heart", "love", "royal", "mystery", "magic", "lavender"],
        "🖤": ["black", "heart", "love", "dark", "goth", "emo", "sad"],
        "🤍": ["white", "heart", "love", "pure", "innocent", "clean", "peace"],
        "🤎": ["brown", "heart", "love", "earth", "nature", "chocolate", "coffee"],
        "💌": ["love", "letter", "romance", "valentine", "mail", "envelope", "note"],
        "💐": ["bouquet", "flowers", "gift", "romance", "valentine", "pretty", "bloom"],
        "💑": ["couple", "heart", "love", "romance", "relationship", "valentine", "pair"],
        "💒": ["wedding", "chapel", "marriage", "ceremony", "bride", "groom", "church"],
        "🎲": ["dice", "game", "gamble", "random", "luck", "chance", "roll"],
        "♠️": ["spade", "suit", "card", "poker", "black", "ace", "club"],
        "♥️": ["heart", "suit", "card", "poker", "red", "ace", "love"],
        "♦️": ["diamond", "suit", "card", "poker", "red", "ace", "gem"],
        "♣️": ["club", "suit", "card", "poker", "black", "ace", "clover"],
        "🃏": ["joker", "card", "wild", "poker", "fool", "trick", "game"],
        "🎴": ["flower", "playing", "card", "japanese", "hanafuda", "game", "traditional"],
        "🀄️": ["mahjong", "red", "dragon", "tile", "game", "chinese", "poker"],
        "🏆": ["trophy", "award", "win", "champion", "first", "place", "prize"],
        "🥇": ["first", "place", "medal", "gold", "winner", "champion", "award"],
        "🪙": ["coin", "money", "gold", "currency", "cash", "treasure", "wealth"],
        "💰": ["money", "bag", "cash", "dollar", "wealth", "rich", "treasure"],
        "📈": ["chart", "increasing", "up", "growth", "profit", "stocks", "trend"],
        "📉": ["chart", "decreasing", "down", "loss", "decline", "stocks", "trend"],
        "⚠️": ["warning", "sign", "danger", "caution", "alert", "attention", "exclamation"],
        "⏳": ["hourglass", "time", "wait", "timer", "sand", "clock", "running"],
        "😮‍💨": ["face", "exhaling", "relief", "phew", "tired", "exhausted", "breath"],
        "😤": ["huffing", "face", "proud", "determined", "confident", "steam", "nose"],
        "🍀": ["four", "leaf", "clover", "luck", "lucky", "irish", "st", "patricks"],
        
        // Animals - Dogs
        "🐶": ["dog", "puppy", "pet", "puppy", "doggy", "canine", "woof", "bark"],
        "🐕": ["dog", "pet", "canine", "woof", "bark", "animal"],
        "🐩": ["poodle", "dog", "curly", "hair", "fancy", "pet", "groomed"],
        "🐺": ["wolf", "wild", "howl", "pack", "moon", "forest", "predator"],
        "🦊": ["fox", "cunning", "red", "wild", "forest", "sly", "animal"],
        "🦝": ["raccoon", "mask", "trash", "panda", "bandit", "night", "cute"],
        "🐱": ["cat", "kitten", "meow", "pet", "feline", "purr", "cute"],
        "🐈": ["cat", "kitten", "meow", "pet", "feline", "purr"],
        "🐈‍⬛": ["black", "cat", "kitten", "meow", "pet", "feline", "halloween"],
        "🦁": ["lion", "king", "jungle", "roar", "mane", "wild", "safari"],
        "🐯": ["tiger", "stripes", "wild", "jungle", "roar", "orange", "predator"],
        "🐅": ["tiger", "stripes", "wild", "jungle", "roar", "orange"],
        "🐆": ["leopard", "spots", "wild", "jungle", "fast", "predator", "safari"],
        "🐴": ["horse", "pony", "ride", "gallop", "neigh", "farm", "animal"],
        "🐎": ["horse", "racing", "fast", "gallop", "neigh", "speed"],
        "🦄": ["unicorn", "magic", "rainbow", "horn", "fantasy", "mythical", "magical"],
        "🦓": ["zebra", "stripes", "safari", "africa", "wild", "black", "white"],
        "🦌": ["deer", "antlers", "forest", "buck", "doe", "wild", "nature"],
        "🦬": ["bison", "buffalo", "wild", "west", "plains", "large", "animal"],
        "🐮": ["cow", "moo", "farm", "milk", "beef", "bovine", "animal"],
        "🐂": ["ox", "bull", "farm", "strong", "power", "horn", "animal"],
        "🐃": ["water", "buffalo", "farm", "strong", "horn", "asia", "animal"],
        "🐄": ["cow", "moo", "farm", "milk", "beef", "bovine"],
        "🐷": ["pig", "oink", "farm", "pink", "cute", "bacon", "animal"],
        "🐖": ["pig", "oink", "farm", "pink", "bacon", "animal"],
        "🐗": ["boar", "wild", "pig", "tusk", "forest", "hunt", "animal"],
        "🐽": ["pig", "nose", "snout", "oink", "farm", "pink"],
        "🐏": ["ram", "sheep", "horn", "farm", "wool", "male", "animal"],
        "🐑": ["sheep", "wool", "farm", "baa", "flock", "white", "animal"],
        "🐐": ["goat", "horn", "farm", "mountain", "climb", "beard", "animal"],
        "🐪": ["camel", "desert", "hump", "sahara", "dry", "hot", "animal"],
        "🐫": ["two", "hump", "camel", "bactrian", "desert", "asia", "animal"],
        "🦙": ["llama", "alpaca", "south", "america", "wool", "cute", "animal"],
        "🦒": ["giraffe", "tall", "neck", "safari", "africa", "spots", "animal"],
        "🐘": ["elephant", "trunk", "big", "safari", "africa", "memory", "animal"],
        "🦣": ["mammoth", "woolly", "extinct", "ice", "age", "prehistoric", "large"],
        "🦏": ["rhino", "rhinoceros", "horn", "safari", "africa", "thick", "skin"],
        "🦛": ["hippo", "hippopotamus", "water", "africa", "large", "river", "animal"],
        "🐭": ["mouse", "squeak", "small", "rodent", "cheese", "pet", "animal"],
        "🐁": ["mouse", "squeak", "small", "rodent", "cheese", "pet"],
        "🐀": ["rat", "rodent", "tail", "pest", "sewer", "dirty", "animal"],
        "🐹": ["hamster", "pet", "cute", "wheel", "small", "rodent", "animal"],
        "🐰": ["rabbit", "bunny", "hop", "ears", "easter", "cute", "animal"],
        "🐇": ["rabbit", "bunny", "hop", "ears", "easter", "cute"],
        "🐿️": ["chipmunk", "squirrel", "nuts", "tree", "cheeks", "cute", "animal"],
        "🦫": ["beaver", "dam", "wood", "teeth", "water", "construction", "animal"],
        "🦔": ["hedgehog", "spikes", "spines", "cute", "small", "animal", "prickly"],
        "🦇": ["bat", "vampire", "night", "wing", "halloween", "cave", "animal"],
        "🐻": ["bear", "hug", "teddy", "wild", "forest", "grizzly", "animal"],
        "🐻‍❄️": ["polar", "bear", "white", "arctic", "ice", "cold", "snow"],
        "🐨": ["koala", "australia", "eucalyptus", "cute", "tree", "marsupial", "animal"],
        "🐼": ["panda", "bamboo", "china", "cute", "black", "white", "animal"],
        "🦥": ["sloth", "slow", "tree", "lazy", "hanging", "cute", "animal"],
        "🦦": ["otter", "water", "swim", "playful", "cute", "river", "animal"],
        "🦨": ["skunk", "stripe", "smell", "spray", "black", "white", "animal"],
        "🦘": ["kangaroo", "australia", "pouch", "hop", "jump", "marsupial", "animal"],
        "🦡": ["badger", "stripe", "dig", "burrow", "wild", "animal"],
        
        // Animals - Birds
        "🐓": ["rooster", "chicken", "cock", "crow", "farm", "morning", "bird"],
        "🐔": ["chicken", "hen", "farm", "egg", "cluck", "bird", "animal"],
        "🐣": ["hatching", "chick", "baby", "egg", "crack", "newborn", "bird"],
        "🐤": ["baby", "chick", "yellow", "cute", "small", "bird", "animal"],
        "🐥": ["front", "facing", "baby", "chick", "yellow", "cute", "bird"],
        "🦆": ["duck", "quack", "water", "pond", "bill", "bird", "animal"],
        "🦢": ["swan", "elegant", "white", "graceful", "water", "bird", "beautiful"],
        "🦅": ["eagle", "bird", "prey", "freedom", "america", "fly", "wild"],
        "🦉": ["owl", "wise", "night", "hoot", "bird", "nocturnal", "animal"],
        "🦤": ["dodo", "extinct", "bird", "island", "mauritius", "flightless"],
        "🪶": ["feather", "bird", "light", "fly", "plume", "quill", "soft"],
        "🦩": ["flamingo", "pink", "bird", "tropical", "long", "legs", "elegant"],
        "🦚": ["peacock", "feathers", "beautiful", "colorful", "display", "bird", "fancy"],
        "🦜": ["parrot", "talk", "colorful", "tropical", "bird", "pet", "mimic"],
        
        // Animals - Marine
        "🐸": ["frog", "ribbit", "green", "pond", "jump", "amphibian", "animal"],
        "🐊": ["crocodile", "alligator", "teeth", "water", "danger", "reptile", "animal"],
        "🐢": ["turtle", "slow", "shell", "water", "reptile", "old", "animal"],
        "🦎": ["lizard", "reptile", "gecko", "tail", "scales", "animal"],
        "🐍": ["snake", "slither", "reptile", "danger", "venom", "slim", "animal"],
        "🐲": ["dragon", "face", "fire", "mythical", "fantasy", "chinese", "animal"],
        "🐉": ["dragon", "fire", "mythical", "fantasy", "chinese", "serpent", "long"],
        "🦕": ["sauropod", "dinosaur", "long", "neck", "prehistoric", "extinct", "large"],
        "🦖": ["t", "rex", "tyrannosaurus", "dinosaur", "prehistoric", "extinct", "teeth"],
        "🐳": ["spouting", "whale", "ocean", "large", "water", "marine", "animal"],
        "🐋": ["whale", "ocean", "large", "water", "marine", "mammal", "animal"],
        "🐬": ["dolphin", "smart", "ocean", "water", "marine", "playful", "animal"],
        "🦭": ["seal", "water", "ocean", "marine", "cute", "flippers", "animal"],
        "🐟": ["fish", "swim", "water", "ocean", "marine", "scales", "animal"],
        "🐠": ["tropical", "fish", "colorful", "coral", "reef", "ocean", "marine"],
        "🐡": ["blowfish", "puffer", "fish", "spikes", "water", "marine", "animal"],
        "🦈": ["shark", "teeth", "ocean", "danger", "marine", "predator", "animal"],
        "🐙": ["octopus", "tentacles", "eight", "arms", "ocean", "marine", "animal"],
        "🐚": ["spiral", "shell", "beach", "ocean", "seashell", "conch", "marine"],
        
        // Animals - Insects
        "🐌": ["snail", "slow", "shell", "slime", "trail", "garden", "animal"],
        "🦋": ["butterfly", "wings", "colorful", "fly", "garden", "beautiful", "insect"],
        "🐛": ["bug", "insect", "caterpillar", "garden", "green", "crawl", "animal"],
        "🐜": ["ant", "insect", "small", "work", "colony", "garden", "animal"],
        "🐝": ["bee", "honey", "buzz", "sting", "yellow", "insect", "animal"],
        "🪲": ["beetle", "insect", "bug", "shell", "garden", "hard", "animal"],
        "🐞": ["ladybug", "lady", "beetle", "red", "spots", "garden", "insect"],
        "🦗": ["cricket", "chirp", "insect", "jump", "night", "sound", "animal"],
        "🪳": ["cockroach", "roach", "insect", "pest", "dirty", "survive", "animal"],
        "🕷️": ["spider", "web", "eight", "legs", "insect", "creepy", "animal"],
        "🕸️": ["spider", "web", "silk", "trap", "corner", "halloween", "spider"],
        "🦂": ["scorpion", "sting", "tail", "danger", "desert", "poison", "animal"],
        "🦟": ["mosquito", "bite", "buzz", "blood", "insect", "pest", "animal"],
        "🪰": ["fly", "buzz", "insect", "pest", "gross", "dirty", "animal"],
        "🪱": ["worm", "earth", "dirt", "garden", "long", "slimy", "animal"],
        "🦠": ["microbe", "bacteria", "virus", "germ", "microscopic", "science", "disease"],
        
        // Food - Fruits
        "🍎": ["apple", "red", "fruit", "healthy", "eat", "snack", "food"],
        "🍏": ["green", "apple", "fruit", "healthy", "eat", "snack", "food"],
        "🍐": ["pear", "fruit", "green", "healthy", "eat", "snack", "food"],
        "🍊": ["tangerine", "orange", "fruit", "citrus", "vitamin", "c", "food"],
        "🍋": ["lemon", "yellow", "sour", "citrus", "fruit", "juice", "food"],
        "🍌": ["banana", "yellow", "fruit", "potassium", "monkey", "food", "snack"],
        "🍉": ["watermelon", "red", "summer", "fruit", "juicy", "seeds", "food"],
        "🍇": ["grapes", "purple", "fruit", "wine", "vine", "bunch", "food"],
        "🍓": ["strawberry", "red", "fruit", "sweet", "berries", "summer", "food"],
        "🫐": ["blueberries", "blue", "fruit", "berries", "healthy", "antioxidant", "food"],
        "🍈": ["melon", "cantaloupe", "orange", "fruit", "sweet", "summer", "food"],
        "🍒": ["cherries", "red", "fruit", "sweet", "pair", "summer", "food"],
        "🍑": ["peach", "orange", "fruit", "fuzzy", "sweet", "summer", "food"],
        "🥭": ["mango", "orange", "fruit", "tropical", "sweet", "summer", "food"],
        "🍍": ["pineapple", "yellow", "tropical", "fruit", "spiky", "sweet", "food"],
        "🥥": ["coconut", "tropical", "fruit", "milk", "water", "beach", "food"],
        "🥝": ["kiwi", "fruit", "green", "fuzzy", "seeds", "healthy", "food"],
        "🍅": ["tomato", "red", "vegetable", "fruit", "salad", "sauce", "food"],
        "🍆": ["eggplant", "purple", "vegetable", "aubergine", "cooking", "food"],
        "🥑": ["avocado", "green", "fruit", "toast", "healthy", "guacamole", "food"],
        
        // Food - Vegetables
        "🥦": ["broccoli", "green", "vegetable", "healthy", "tree", "food"],
        "🥬": ["leafy", "greens", "lettuce", "vegetable", "salad", "healthy", "food"],
        "🥒": ["cucumber", "green", "vegetable", "salad", "pickle", "fresh", "food"],
        "🌶️": ["pepper", "hot", "spicy", "chili", "red", "vegetable", "food"],
        "🌽": ["corn", "ear", "yellow", "vegetable", "popcorn", "farm", "food"],
        "🥕": ["carrot", "orange", "vegetable", "rabbit", "healthy", "vitamin", "food"],
        "🫒": ["olive", "green", "fruit", "oil", "mediterranean", "food"],
        "🥔": ["potato", "brown", "vegetable", "fries", "mashed", "food"],
        "🥐": ["croissant", "french", "bread", "pastry", "butter", "breakfast", "food"],
        "🥯": ["bagel", "bread", "round", "hole", "breakfast", "cream", "cheese", "food"],
        "🍞": ["bread", "loaf", "slice", "toast", "bake", "food"],
        "🥖": ["baguette", "french", "bread", "long", "crusty", "food"],
        "🥨": ["pretzel", "twisted", "salty", "snack", "german", "food"],
        "🧀": ["cheese", "wedge", "dairy", "swiss", "cheddar", "food"],
        "🥚": ["egg", "chicken", "breakfast", "protein", "white", "yolk", "food"],
        "🍳": ["cooking", "pan", "fried", "egg", "breakfast", "food"],
        "🥘": ["shallow", "pan", "food", "paella", "cooking", "meal"],
        "🍲": ["pot", "food", "stew", "soup", "cooking", "hot", "meal"],
        "🫕": ["fondue", "pot", "cheese", "chocolate", "swiss", "dip", "food"],
        "🥣": ["bowl", "spoon", "cereal", "soup", "breakfast", "food"],
        "🥗": ["green", "salad", "bowl", "healthy", "vegetables", "fresh", "food"],
        "🍿": ["popcorn", "movie", "snack", "corn", "theater", "food"],
        "🧈": ["butter", "dairy", "spread", "yellow", "cooking", "food"],
        "🧂": ["salt", "shaker", "seasoning", "salty", "cooking", "spice"],
        "🥫": ["canned", "food", "can", "tin", "preserved", "food"],
        
        // Food - Prepared
        "🍱": ["bento", "box", "japanese", "lunch", "rice", "food"],
        "🍘": ["rice", "cracker", "japanese", "snack", "food"],
        "🍙": ["rice", "ball", "onigiri", "japanese", "snack", "food"],
        "🍚": ["cooked", "rice", "bowl", "japanese", "chinese", "food"],
        "🍛": ["curry", "rice", "spicy", "indian", "japanese", "food"],
        "🍜": ["steaming", "bowl", "ramen", "noodles", "soup", "japanese", "food"],
        "🍝": ["spaghetti", "pasta", "italian", "noodles", "tomato", "sauce", "food"],
        "🍠": ["roasted", "sweet", "potato", "japanese", "snack", "food"],
        "🍢": ["oden", "skewer", "japanese", "food", "stick", "hot"],
        "🍣": ["sushi", "japanese", "fish", "rice", "raw", "food"],
        "🍤": ["fried", "shrimp", "tempura", "japanese", "seafood", "food"],
        "🍥": ["fish", "cake", "swirl", "naruto", "japanese", "food"],
        "🥮": ["moon", "cake", "chinese", "festival", "sweet", "food"],
        "🍡": ["dango", "sweet", "japanese", "dessert", "skewer", "food"],
        "🥟": ["dumpling", "potsticker", "chinese", "steamed", "food"],
        "🥠": ["fortune", "cookie", "chinese", "dessert", "message", "food"],
        "🥡": ["takeout", "box", "chinese", "food", "container", "leftovers"],
        
        // Food - Asian
        "🦀": ["crab", "seafood", "claws", "ocean", "red", "food"],
        "🦞": ["lobster", "seafood", "claws", "red", "expensive", "food"],
        "🦐": ["shrimp", "prawn", "seafood", "pink", "ocean", "food"],
        "🦑": ["squid", "octopus", "seafood", "tentacles", "ocean", "food"],
        "🦪": ["oyster", "seafood", "pearl", "shell", "ocean", "food"],
        
        // Food - Fast Food
        "🍦": ["soft", "ice", "cream", "cone", "dessert", "sweet", "food"],
        "🍧": ["shaved", "ice", "snow", "cone", "dessert", "cold", "food"],
        "🍨": ["ice", "cream", "bowl", "dessert", "sweet", "cold", "food"],
        "🍩": ["doughnut", "donut", "sweet", "hole", "glazed", "dessert", "food"],
        "🍪": ["cookie", "biscuit", "sweet", "chocolate", "chip", "dessert", "food"],
        "🎂": ["birthday", "cake", "candles", "celebration", "dessert", "sweet", "food"],
        "🍰": ["shortcake", "cake", "slice", "strawberry", "dessert", "sweet", "food"],
        "🧁": ["cupcake", "sweet", "frosting", "dessert", "small", "food"],
        "🥧": ["pie", "dessert", "sweet", "crust", "slice", "food"],
        "🍫": ["chocolate", "bar", "sweet", "candy", "cocoa", "food"],
        "🍬": ["candy", "sweet", "sugar", "lollipop", "treat", "food"],
        "🍭": ["lollipop", "candy", "sweet", "sucker", "stick", "food"],
        "🍮": ["custard", "pudding", "dessert", "sweet", "japanese", "food"],
        "🍯": ["honey", "pot", "sweet", "bee", "sticky", "food"],
        "🍼": ["baby", "bottle", "milk", "infant", "feeding", "food"],
        "🥛": ["glass", "milk", "drink", "dairy", "white", "calcium", "food"],
        "☕": ["hot", "beverage", "coffee", "tea", "drink", "caffeine", "food"],
        "🫖": ["teapot", "tea", "drink", "hot", "brew", "food"],
        "🍵": ["teacup", "tea", "drink", "hot", "green", "japanese", "food"],
        "🍶": ["sake", "bottle", "cup", "japanese", "alcohol", "drink", "food"],
        "🍾": ["champagne", "bottle", "popping", "cork", "celebration", "drink", "food"],
        "🍷": ["wine", "glass", "red", "drink", "alcohol", "grape", "food"],
        "🍸": ["cocktail", "glass", "drink", "alcohol", "martini", "food"],
        "🍹": ["tropical", "drink", "cocktail", "umbrella", "vacation", "alcohol", "food"],
        "🍺": ["beer", "mug", "drink", "alcohol", "foam", "food"],
        "🍻": ["clinking", "beer", "mugs", "cheers", "toast", "drink", "alcohol", "food"],
        "🥂": ["clinking", "glasses", "champagne", "toast", "celebration", "drink", "food"],
        "🥃": ["tumbler", "glass", "whiskey", "drink", "alcohol", "bourbon", "scotch", "food"],
        "🥤": ["cup", "straw", "drink", "soda", "beverage", "food"],
        "🧋": ["bubble", "tea", "pearl", "milk", "tapioca", "drink", "food"],
        "🧃": ["beverage", "box", "juice", "drink", "straw", "food"],
        "🧉": ["mate", "drink", "tea", "south", "america", "straw", "food"],
        "🧊": ["ice", "cube", "cold", "frozen", "water", "drink", "food"],
        
        // Food - Dishes
        "🥢": ["chopsticks", "eating", "japanese", "chinese", "utensils", "food"],
        "🍽️": ["fork", "knife", "plate", "dining", "meal", "utensils", "food"],
        "🍴": ["fork", "knife", "cutlery", "eating", "utensils", "food"],
        "🥄": ["spoon", "eating", "utensil", "soup", "food"],
        "🔪": ["kitchen", "knife", "cutting", "cooking", "sharp", "utensil", "food"],
        "🫙": ["jar", "container", "preserve", "pickle", "food"],
        
        // Activities & Sports
        "⚽": ["soccer", "ball", "football", "sport", "game", "kick", "activity"],
        "🏀": ["basketball", "ball", "sport", "game", "hoop", "nba", "activity"],
        "🏈": ["american", "football", "ball", "sport", "game", "nfl", "activity"],
        "⚾": ["baseball", "ball", "sport", "game", "bat", "mlb", "activity"],
        "🥎": ["softball", "ball", "sport", "game", "yellow", "activity"],
        "🎾": ["tennis", "ball", "racket", "sport", "game", "wimbledon", "activity"],
        "🏐": ["volleyball", "ball", "sport", "game", "net", "beach", "activity"],
        "🏉": ["rugby", "football", "ball", "sport", "game", "oval", "activity"],
        "🎱": ["pool", "8", "ball", "billiards", "game", "cue", "activity"],
        "🏓": ["ping", "pong", "table", "tennis", "paddle", "game", "activity"],
        "🏸": ["badminton", "racket", "shuttlecock", "sport", "game", "activity"],
        "🥅": ["goal", "net", "soccer", "hockey", "sport", "game", "activity"],
        "⛳": ["flag", "hole", "golf", "sport", "game", "course", "activity"],
        "🏌️": ["golfing", "person", "golf", "sport", "club", "activity"],
        "🏌️‍♂️": ["golfing", "man", "golf", "sport", "club", "activity"],
        "🏌️‍♀️": ["golfing", "woman", "golf", "sport", "club", "activity"],
        "🏏": ["cricket", "bat", "ball", "sport", "game", "wicket", "activity"],
        "🏑": ["field", "hockey", "stick", "ball", "sport", "game", "activity"],
        "🏒": ["ice", "hockey", "stick", "puck", "sport", "game", "activity"],
        "🥍": ["lacrosse", "stick", "ball", "sport", "game", "net", "activity"],
        "🏹": ["bow", "arrow", "archery", "hunt", "target", "sport", "activity"],
        "🎣": ["fishing", "pole", "fish", "hook", "bait", "sport", "activity"],
        "🥊": ["boxing", "glove", "punch", "fight", "sport", "activity"],
        "🥋": ["martial", "arts", "uniform", "karate", "judo", "sport", "activity"],
        "🎽": ["running", "shirt", "marathon", "race", "sport", "activity"],
        "🛹": ["skateboard", "skate", "wheels", "trick", "sport", "activity"],
        "🛷": ["sled", "sledge", "snow", "winter", "slide", "activity"],
        "⛸️": ["ice", "skate", "skating", "winter", "sport", "activity"],
        "🥌": ["curling", "stone", "ice", "sport", "game", "sweep", "activity"],
        "🎿": ["skis", "skiing", "snow", "winter", "sport", "activity"],
        "⛷️": ["skier", "skiing", "snow", "winter", "sport", "activity"],
        "🏂": ["snowboarder", "snowboarding", "snow", "winter", "sport", "activity"],
        "🏋️": ["weight", "lifting", "person", "gym", "strength", "sport", "activity"],
        "🏋️‍♂️": ["weight", "lifting", "man", "gym", "strength", "sport", "activity"],
        "🏋️‍♀️": ["weight", "lifting", "woman", "gym", "strength", "sport", "activity"],
        "🚴": ["bicyclist", "bike", "cycling", "sport", "activity"],
        "🚴‍♂️": ["bicyclist", "man", "bike", "cycling", "sport", "activity"],
        "🚴‍♀️": ["bicyclist", "woman", "bike", "cycling", "sport", "activity"],
        "🚵": ["mountain", "bicyclist", "bike", "cycling", "sport", "activity"],
        "🚵‍♂️": ["mountain", "bicyclist", "man", "bike", "cycling", "sport", "activity"],
        "🚵‍♀️": ["mountain", "bicyclist", "woman", "bike", "cycling", "sport", "activity"],
        "🤸": ["person", "cartwheeling", "gymnastics", "sport", "activity"],
        "🤸‍♂️": ["man", "cartwheeling", "gymnastics", "sport", "activity"],
        "🤸‍♀️": ["woman", "cartwheeling", "gymnastics", "sport", "activity"],
        "🤼": ["wrestling", "people", "fight", "sport", "activity"],
        "🤼‍♂️": ["men", "wrestling", "fight", "sport", "activity"],
        "🤼‍♀️": ["women", "wrestling", "fight", "sport", "activity"],
        "🤽": ["water", "polo", "person", "swimming", "sport", "activity"],
        "🤽‍♂️": ["water", "polo", "man", "swimming", "sport", "activity"],
        "🤽‍♀️": ["water", "polo", "woman", "swimming", "sport", "activity"],
        "🤾": ["handball", "person", "sport", "game", "activity"],
        "🤾‍♂️": ["handball", "man", "sport", "game", "activity"],
        "🤾‍♀️": ["handball", "woman", "sport", "game", "activity"],
        "🤹": ["juggling", "person", "circus", "trick", "activity"],
        "🤹‍♂️": ["juggling", "man", "circus", "trick", "activity"],
        "🤹‍♀️": ["juggling", "woman", "circus", "trick", "activity"],
        "🧘": ["person", "lotus", "position", "yoga", "meditation", "activity"],
        "🧘‍♂️": ["man", "lotus", "position", "yoga", "meditation", "activity"],
        "🧘‍♀️": ["woman", "lotus", "position", "yoga", "meditation", "activity"],
        
        // Transportation
        "🚗": ["car", "automobile", "vehicle", "drive", "road", "transport"],
        "🚕": ["taxi", "cab", "vehicle", "ride", "yellow", "transport"],
        "🚙": ["suv", "sport", "utility", "vehicle", "car", "transport"],
        "🚌": ["bus", "public", "transport", "vehicle", "passengers", "transport"],
        "🚎": ["trolleybus", "bus", "electric", "public", "transport", "vehicle"],
        "🏎️": ["racing", "car", "speed", "fast", "race", "vehicle", "transport"],
        "🏍️": ["motorcycle", "bike", "motor", "vehicle", "speed", "transport"],
        "🛵": ["motor", "scooter", "vehicle", "electric", "transport"],
        "🛺": ["auto", "rickshaw", "tuk", "tuk", "vehicle", "asia", "transport"],
        "🚜": ["tractor", "farm", "vehicle", "agriculture", "transport"],
        "🚛": ["truck", "delivery", "vehicle", "large", "transport"],
        "🚚": ["delivery", "truck", "package", "vehicle", "transport"],
        "🚐": ["minibus", "van", "vehicle", "passengers", "transport"],
        "🚑": ["ambulance", "emergency", "medical", "vehicle", "hospital", "transport"],
        "🚒": ["fire", "engine", "truck", "emergency", "vehicle", "transport"],
        "🚓": ["police", "car", "cop", "emergency", "vehicle", "transport"],
        "🚔": ["oncoming", "police", "car", "cop", "emergency", "vehicle", "transport"],
        "🚨": ["rotating", "light", "police", "emergency", "siren", "vehicle"],
        "🚍": ["oncoming", "bus", "public", "transport", "vehicle"],
        "🚘": ["oncoming", "automobile", "car", "vehicle", "transport"],
        "🚖": ["oncoming", "taxi", "cab", "vehicle", "transport"],
        "🚡": ["aerial", "tramway", "cable", "car", "mountain", "transport"],
        "🚠": ["mountain", "cableway", "gondola", "ski", "transport"],
        "🚟": ["suspension", "railway", "train", "transport"],
        "🚃": ["tram", "car", "trolley", "public", "transport"],
        "🚋": ["tram", "car", "trolley", "public", "transport"],
        "🚞": ["mountain", "railway", "train", "transport"],
        "🚝": ["monorail", "train", "transport"],
        "🚄": ["high", "speed", "train", "bullet", "fast", "transport"],
        "🚅": ["bullet", "train", "high", "speed", "fast", "transport"],
        "🚈": ["light", "rail", "train", "transport"],
        "🚆": ["train", "railway", "transport"],
        "🚇": ["metro", "subway", "underground", "train", "transport"],
        "🚊": ["tram", "trolley", "public", "transport"],
        "🚉": ["station", "train", "railway", "transport"],
        "🚁": ["helicopter", "chopper", "air", "transport"],
        "🛩️": ["small", "airplane", "aircraft", "air", "transport"],
        "✈️": ["airplane", "flight", "air", "travel", "transport"],
        "🛫": ["airplane", "departure", "takeoff", "flight", "transport"],
        "🛬": ["airplane", "arrival", "landing", "flight", "transport"],
        "🪂": ["parachute", "sky", "jump", "sport", "transport"],
        "💺": ["seat", "chair", "sit", "airplane", "transport"],
    ]
    /// All available emojis on iOS
    /// This uses a comprehensive approach to collect all emoji characters
    public static let allEmojis: [String] = {
        var emojis: Set<String> = []
        
        // Iterate through Unicode ranges that contain emojis
        let ranges: [(start: UInt32, end: UInt32)] = [
            (0x1F600, 0x1F64F), // Emoticons
            (0x1F300, 0x1F5FF), // Misc Symbols and Pictographs
            (0x1F680, 0x1F6FF), // Transport and Map
            (0x2600, 0x26FF),   // Misc symbols
            (0x2700, 0x27BF),   // Dingbats
            (0x1F900, 0x1F9FF), // Supplemental Symbols and Pictographs
            (0x1FA00, 0x1FA6F), // Chess Symbols
            (0x1FA70, 0x1FAFF), // Symbols and Pictographs Extended-A
            (0x1F018, 0x1F270), // Various asian characters
            (0x238C, 0x2454),  // Misc
            (0x20D0, 0x20FF),   // Combining Diacritical Marks for Symbols
        ]
        
        // Collect emoji characters from ranges
        for range in ranges {
            for codePoint in range.start...range.end {
                if let scalar = Unicode.Scalar(codePoint) {
                    let character = Character(scalar)
                    if character.isEmoji {
                        emojis.insert(String(character))
                    }
                }
            }
        }
        
        // Also scan through extended ranges
        for codePoint in 0x1F000...0x1FFFF {
            if let scalar = Unicode.Scalar(codePoint) {
                let character = Character(scalar)
                if character.isEmoji {
                    emojis.insert(String(character))
                }
            }
        }
        
        // Add common emoji sequences (including skin tone variations and zero-width joiners)
        let commonEmojis: [String] = [
            "❤️", "👍", "😂", "😮", "🙏", "🔥", "👏", "💯", "🎉", "😍",
            "🤔", "😎", "😱", "🤯", "💪", "🤑", "✨", "🎯", "😭", "😡",
            "🚀", "🤮", "🎲", "♠️", "♥️", "♦️", "♣️", "🃏", "🎴", "🀄️",
            "🏆", "🥇", "🪙", "💰", "📈", "📉", "⚠️", "⏳", "😮‍💨", "😤",
            "🍻", "🥃", "🍀", "😄", "😊", "😉", "😇", "🥰", "😘", "😜",
            "🤗", "🙃", "🙂", "🤩", "🥳", "😏", "😴", "🤤", "🤒", "🤕",
            "🤢", "🤧", "🥶", "🥵", "😐", "😑", "😶", "🙄", "😬", "😔",
            "😕", "😟", "😳", "🤫", "🤭", "🫣", "🫠", "🤐", "🤠", "🤡",
            "👻", "💀", "👽", "😁", "😆", "😅", "🤣", "😋", "😛", "😝",
            "🥲", "🤪", "🥴", "🥹", "😷", "🤥", "😈", "👿", "👹", "👺",
            "🤖", "👾", "😺", "😸", "😹", "😻", "😼", "😽", "🙀", "😿",
            "😾", "👋", "🤲", "🤝", "✋", "🖐", "🖖", "👌", "🤌", "🤏",
            "🤞", "🤟", "🤘", "🤙", "👈", "👉", "👆", "👇", "☝️", "👊",
            "🤛", "🤜", "🤚", "✍️", "🙌", "👐", "🫶", "💅", "🤳", "🦾",
            "🦵", "🦶", "👣", "👀", "🧠", "🫀", "🫁", "🦷", "🦴", "👅",
            "👄", "🫦", "💋", "💘", "💝", "💖", "💗", "💓", "💞", "💢",
            "💥", "💫", "💦", "💨", "🕳️", "⭐", "🌟", "🪄", "🌈", "☀️",
            "🌤️", "⛅", "🌥️", "🌦️", "🌧️", "⛈️", "🌩️", "🌪️", "🌫️", "🌬️",
            "🌀", "🌊", "❄️", "👎", "❤️‍🔥", "❤️‍🩹", "💔", "❣️", "💕", "💞",
            "💟", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎", "💋",
            "💌", "💐", "💑", "💒", "💓", "💔", "💕", "💖", "💗", "💘",
        ]
        
        for emoji in commonEmojis {
            emojis.insert(emoji)
        }
        
        // Convert to array and sort
        return Array(emojis).sorted { $0 < $1 }
    }()
    
    /// Search emojis by query string
    /// Uses tags, Unicode name properties, and simple string matching
    public static func search(_ query: String) -> [String] {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return allEmojis
        }
        
        let lowercasedQuery = query.lowercased()
        
        return allEmojis.filter { emoji in
            // First check tags (most reliable)
            if let tags = emojiTags[emoji] {
                for tag in tags {
                    if tag.lowercased().contains(lowercasedQuery) {
                        return true
                    }
                }
            }
            
            // Check Unicode name if available
            for scalar in emoji.unicodeScalars {
                if let name = scalar.properties.name {
                    if name.lowercased().contains(lowercasedQuery) {
                        return true
                    }
                }
            }
            
            // Fallback: simple string contains check
            return emoji.lowercased().contains(lowercasedQuery)
        }
    }
    
    // MARK: - Recently Used Emojis
    
    private static let recentlyUsedEmojisKey = "EmojiProvider.recentlyUsedEmojis"
    private static let maxRecentlyUsedCount = 24
    
    /// Default popular emojis to show when user hasn't used any yet
    private static let defaultPopularEmojis: [String] = [
        "❤️", "😂", "👍", "😮", "🙏", "🔥", "👏", "💯",
        "🎉", "😍", "🤔", "😎", "😱", "🤯", "💪", "🤑",
        "✨", "🎯", "😭", "😡", "🚀", "😄", "😊", "🥰"
    ]
    
    /// Record that an emoji was used
    /// This updates the recently used list and persists it to UserDefaults
    public static func recordUsage(_ emoji: String) {
        var recentlyUsed = getRecentlyUsedEmojis()
        
        // Remove the emoji if it already exists (to move it to the front)
        recentlyUsed.removeAll { $0 == emoji }
        
        // Add to the front
        recentlyUsed.insert(emoji, at: 0)
        
        // Limit to maxRecentlyUsedCount
        if recentlyUsed.count > maxRecentlyUsedCount {
            recentlyUsed = Array(recentlyUsed.prefix(maxRecentlyUsedCount))
        }
        
        // Save to UserDefaults
        UserDefaults.standard.set(recentlyUsed, forKey: recentlyUsedEmojisKey)
    }
    
    /// Get the list of recently used emojis
    private static func getRecentlyUsedEmojis() -> [String] {
        return UserDefaults.standard.stringArray(forKey: recentlyUsedEmojisKey) ?? []
    }
    
    /// Get the short list of emojis (recently used + popular, capped at 24)
    /// Recently used emojis appear first, followed by popular emojis that aren't already in the list
    public static var shortList: [String] {
        let recentlyUsed = getRecentlyUsedEmojis()
        let popularEmojis = defaultPopularEmojis
        
        var result: [String] = []
        
        // Add recently used emojis first
        result.append(contentsOf: recentlyUsed)
        
        // Add popular emojis that aren't already in the list
        let remainingCount = maxRecentlyUsedCount - result.count
        if remainingCount > 0 {
            let popularNotInRecent = popularEmojis.filter { !result.contains($0) }
            result.append(contentsOf: popularNotInRecent.prefix(remainingCount))
        }
        
        // Ensure we don't exceed the limit
        return Array(result.prefix(maxRecentlyUsedCount))
    }
}

// MARK: - Character Extension
extension Character {
    /// Check if a character is an emoji
    var isEmoji: Bool {
        guard let scalar = unicodeScalars.first else { return false }
        return scalar.properties.isEmoji
    }
}

