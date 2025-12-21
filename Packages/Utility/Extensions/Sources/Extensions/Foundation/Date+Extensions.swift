import Foundation

extension Date {
    // Avoids expense of creating a new `DateFormatter`
    // each time we need a string
    @MainActor
    private static var formattersCache = [String: DateFormatter]()
    
    @MainActor
    public func string(_ dateFormat: String) -> String {
        if let formatter: DateFormatter = Date.formattersCache[dateFormat] {
            return formatter.string(from: self)
        }
        
        let formatter: DateFormatter = .init(dateFormat: dateFormat)
        Date.formattersCache[dateFormat] = formatter
        return formatter.string(from: self)
    }
    
    public func addYears(_ count: Int) -> Date {
        var dateComponents: DateComponents = .init()
        dateComponents.year = count
        return Calendar.current.date(byAdding: dateComponents, to: self)!
    }
    
    public func addMonths(_ count: Int) -> Date {
        var dateComponents: DateComponents = .init()
        dateComponents.month = count
        return Calendar.current.date(byAdding: dateComponents, to: self)!
    }
    
    public func addWeeks(_ count: Int) -> Date {
        var dateComponents: DateComponents = .init()
        dateComponents.weekOfYear = count
        return Calendar.current.date(byAdding: dateComponents, to: self)!
    }
    
    public func addDays(_ daysToAdd: Int) -> Date {
        var dateComponents: DateComponents = .init()
        dateComponents.day = daysToAdd
        return Calendar.current.date(byAdding: dateComponents, to: self)!
    }
    
    public func addHours(_ hoursToAdd: Int) -> Date {
        var dateComponents: DateComponents = .init()
        dateComponents.hour = hoursToAdd
        return Calendar.current.date(byAdding: dateComponents, to: self)!
    }
    
    public func addMinutes(_ minutesToAdd: Int) -> Date {
        var dateComponents: DateComponents = .init()
        dateComponents.minute = minutesToAdd
        return Calendar.current.date(byAdding: dateComponents, to: self)!
    }
    
    public func addSeconds(_ secondsToAdd: Int) -> Date {
        var dateComponents: DateComponents = .init()
        dateComponents.second = secondsToAdd
        return Calendar.current.date(byAdding: dateComponents, to: self)!
    }
    
    public var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
    
    public var endOfDay: Date {
        startOfDay
            .addDays(1)
            .addSeconds(-1)
    }
    
    public func yearsFrom(_ date: Date) -> Int{
        (Calendar.current as NSCalendar).components(.year, from: date, to: self, options: []).year!
    }
    
    public func monthsFrom(_ date: Date) -> Int{
        (Calendar.current as NSCalendar).components(.month, from: date, to: self, options: []).month!
    }
    
    public func weeksFrom(_ date: Date) -> Int{
        (Calendar.current as NSCalendar).components(.weekOfYear, from: date, to: self, options: []).weekOfYear!
    }
    
    public func daysFrom(_ date: Date) -> Int{
        (Calendar.current as NSCalendar).components(.day, from: date, to: self, options: []).day!
    }
    
    public func hoursFrom(_ date: Date) -> Int{
        (Calendar.current as NSCalendar).components(.hour, from: date, to: self, options: []).hour!
    }
    
    public func minutesFrom(_ date: Date) -> Int{
        (Calendar.current as NSCalendar).components(.minute, from: date, to: self, options: []).minute!
    }
    
    public func secondsFrom(_ date: Date) -> Int{
        (Calendar.current as NSCalendar).components(.second, from: date, to: self, options: []).second!
    }
    
    public var hour: Int {
        let calendar = Calendar.current
        let comp = (calendar as NSCalendar).components([.hour], from: self)
        return comp.hour!
    }
    
    public var minute: Int {
        let calendar = Calendar.current
        let comp = (calendar as NSCalendar).components([.minute], from: self)
        return comp.minute!
    }
    
    public var dayInt: Int {
        let calendar = Calendar.current
        let comp = (calendar as NSCalendar).components([.day], from: self)
        return comp.day!
    }
    
    public var yearInt: Int {
        let calendar = Calendar.current
        let comp = (calendar as NSCalendar).components([.year], from: self)
        return comp.year!
    }
    
    /// Different day with same hour and minute
    public func update(toDay day: Date) -> Date {
        let hours: Int = hoursFrom(startOfDay)
        let minutes: Int = minutesFrom(startOfDay.addHours(hours))
        return day.addHours(hours).addMinutes(minutes)
    }
    
    public var agoShort: String {
        if minutesFrom(Date()) == 0 { return "Now" }
        return abs((minutesFrom(Date()))).minutesStringUpToDaysAbbreviated
    }

    public var ago: String {
        if minutesFrom(Date()) == 0 { return "Just now"}
        return abs((minutesFrom(Date()))).minutesStringUpToDaysConcise + " ago"
    }
    
    /// Formats date based on relative to now.
    /// e.g., "Today", "Yesterday", "Tuesday", etc.
    @MainActor
    public func timeAwareDate(useFullMonthName: Bool = false) -> String {
        let cal = Calendar(identifier: .gregorian)
        
        if cal.isDateInToday(self) {
            return "Today"
        }
        
        if cal.isDateInYesterday(self) {
            return "Yesterday"
        }
        
        if cal.isDateInTomorrow(self) {
            return "Tomorrow"
        }
        
        let daysFromToday = abs(daysFrom(Date()))
        if daysFromToday < 7 {
            return string("EEEE")
        }
        
        let monthFormat = useFullMonthName ? "MMMM" : "MMM"
        
        if yearInt == Date().yearInt {
            return string(monthFormat + " d")
        }
        
        return string(monthFormat + " d, YYYY")
    }
    
    /// e.g., Fri, 27 Mar 2020 13:20:50 +0000
    @MainActor
    public var fullLengthDetail: String {
        string("E, d MMM yyyy HH:mm:ss Z")
    }

    public func formatted(dateFormat: Date.FormatStyle) -> String {
        formatted(dateFormat)
    }
}

extension DateFormatter {
    public convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }
    
    public convenience init(dateStyle: DateFormatter.Style) {
        self.init()
        self.dateStyle = dateStyle
    }
}

extension Date.FormatStyle {
    /// e.g., 2025
    public static func yearOnly() -> Self {
        Date.FormatStyle()
            .year(.defaultDigits)
    }
    
    /// e..g, Dec 2025
    public static func shortMonthAndYear() -> Self {
        Date.FormatStyle()
            .year(.defaultDigits)
            .month(.abbreviated)
    }
    
    /// e.g., Tuesday
    public static func weekdayOnly() -> Self {
        Date.FormatStyle()
            .weekday()
    }
    
    /// e.g., Dec 6, 2025
    public static func shortMonthDayAndYear() -> Self {
        Date.FormatStyle()
            .year(.defaultDigits)
            .day(.defaultDigits)
            .month(.abbreviated)
    }
    
    /// e.g., Tue, Dec 6 7:59pm
    public static func shortMonthDayAndTime() -> Self {
        shortMonthDayAndYear()
            .hour()
            .minute()
    }
}
