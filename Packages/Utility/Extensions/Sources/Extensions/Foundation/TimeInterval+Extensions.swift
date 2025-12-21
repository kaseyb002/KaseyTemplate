import Foundation

extension TimeInterval {
    
    public var stopwatchFormat: String {
        let time = NSInteger(self)
        
        let ms = Int((self.truncatingRemainder(dividingBy: 1)) * 1000)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours = (time / 3600)
        
        return String(format: "%0.2d:%0.2d:%0.2d.%0.2d",hours,minutes,seconds,ms)
    }
    
    /// e.g., 2h 20m
    public var hrsAndMinFormat: String {
        let oneHour: TimeInterval = 60 * 60
        var total: TimeInterval = self
        var hours: Int = .zero
        while total >= oneHour {
            total -= oneHour
            hours += 1
        }
        
        var components: [String] = []
        
        if hours > .zero {
            components.append("\(hours)h")
        }
        
        if total.minutes > .zero {
            components.append("\(total.minutes)m")
        }
        
        if components.isEmpty {
            return "0m"
        }
        
        return components.joined(separator: " ")
    }
    
    /// e.g., 2h 20m 30s
    public var hrsMinAndSecFormat: String {
        let oneHour: TimeInterval = 60 * 60
        var total: TimeInterval = self
        var hours: Int = .zero
        while total >= oneHour {
            total -= oneHour
            hours += 1
        }
        
        var components: [String] = []
        
        if hours > .zero {
            components.append("\(hours)h")
        }
        
        let oneMinute: TimeInterval = 60
        var minutes: Int = .zero
        while total >= oneMinute {
            total -= oneMinute
            minutes += 1
        }
        
        if minutes > .zero {
            components.append("\(minutes)m")
        }
        
        if total >= 1 {
            components.append("\(Int(total))s")
        }
        
        if components.isEmpty {
            return "0s"
        }
        
        return components.joined(separator: " ")
    }
    
    /// e.g., 2 hours 20 minutes 30 seconds
    public var hrsMinAndSecLongFormat: String {
        let oneHour: TimeInterval = 60 * 60
        var total: TimeInterval = self
        var hours: Int = .zero
        while total >= oneHour {
            total -= oneHour
            hours += 1
        }
        
        var components: [String] = []
        
        if hours > .zero {
            components.append("\(hours) hour\(hours.pluralS)")
        }
        
        let oneMinute: TimeInterval = 60
        var minutes: Int = .zero
        while total >= oneMinute {
            total -= oneMinute
            minutes += 1
        }
        
        if minutes > .zero {
            components.append("\(minutes) minute\(minutes.pluralS)")
        }
        
        if total >= 1 {
            components.append("\(Int(total)) second\(Int(total).pluralS)")
        }
        
        if components.isEmpty {
            return "0 seconds"
        }
        
        return components.joined(separator: " ")
    }
    
    /// e.g., 2 hours 20 minutes 30 seconds
    public var daysHrsMinAndSecLongFormat: String {
        var total: TimeInterval = self
        var components: [String] = []

        let oneDay: TimeInterval = 60 * 60 * 24
        var days: Int = .zero
        while total >= oneDay {
            total -= oneDay
             days += 1
        }
        if days > .zero {
            components.append("\(days) day\(days.pluralS)")
        }
        
        let oneHour: TimeInterval = 60 * 60
        var hours: Int = .zero
        while total >= oneHour {
            total -= oneHour
            hours += 1
        }
        if hours > .zero {
            components.append("\(hours) hour\(hours.pluralS)")
        }
        
        let oneMinute: TimeInterval = 60
        var minutes: Int = .zero
        while total >= oneMinute {
            total -= oneMinute
            minutes += 1
        }
        if minutes > .zero {
            components.append("\(minutes) minute\(minutes.pluralS)")
        }
        
        if total >= 1 {
            components.append("\(Int(total)) second\(Int(total).pluralS)")
        }
        
        if components.isEmpty {
            return "0 seconds"
        }
        
        return components.joined(separator: " ")
    }
    
    /// e.g., "2d", or "3m"  or "3s". One granularity at most
    public var durationSummaryShortFormat: String {
        var total: TimeInterval = self

        let oneDay: TimeInterval = 60 * 60 * 24
        var days: Int = .zero
        while total >= oneDay {
            total -= oneDay
            days += 1
        }
        if days > .zero {
            return "\(days)d"
        }
        
        let oneHour: TimeInterval = 60 * 60
        var hours: Int = .zero
        while total >= oneHour {
            total -= oneHour
            hours += 1
        }
        if hours > .zero {
            return "\(hours)h"
        }
        
        let oneMinute: TimeInterval = 60
        var minutes: Int = .zero
        while total >= oneMinute {
            total -= oneMinute
            minutes += 1
        }
        if minutes > .zero {
            return "\(minutes)m"
        }
        
        if total >= 1 {
            return "\(Int(total))s"
        }
        
        return "0s"
    }
    
    /// e.g., "2d 3h", or "3m 3s". Two granularities at most
    public var durationSummaryFormat: String {
        var total: TimeInterval = self
        var components: [String] = []

        let oneDay: TimeInterval = 60 * 60 * 24
        var days: Int = .zero
        while total >= oneDay {
            total -= oneDay
            days += 1
        }
        if days > .zero {
            components.append("\(days)d")
        }
        
        let oneHour: TimeInterval = 60 * 60
        var hours: Int = .zero
        while total >= oneHour {
            total -= oneHour
            hours += 1
        }
        if hours > .zero {
            components.append("\(hours)h")
        }
        
        let oneMinute: TimeInterval = 60
        var minutes: Int = .zero
        while total >= oneMinute {
            total -= oneMinute
            minutes += 1
        }
        if minutes > .zero {
            components.append("\(minutes)m")
        }
        
        if total >= 1 {
            components.append("\(Int(total))s")
        }
        
        if components.isEmpty {
            return "0s"
        }
        
        return components.prefix(2).joined(separator: " ")
    }
    
    
    public var minutes: Int {
        if self == 0 { return 0 }
        return Int(self / 60)
    }
    
    public var nsNumber: NSNumber {
        NSNumber(value: self)
    }
    
    public static var oneHour: TimeInterval {
        60 * 60
    }
    
    public var nanoSeconds: UInt64 {
        UInt64(self * 1_000_000_000)
    }
}

private extension TimeInterval {
    var units: NSCalendar.Unit {
        if self < 60 * 60 {
            return [.minute, .second]
        }
        
        if self < 60 * 60 * 24 {
            return [.hour, .minute]
        }
        
        return [.day, .hour]
    }
}
