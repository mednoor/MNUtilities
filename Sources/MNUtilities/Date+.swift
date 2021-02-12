//
//  Date+.swift
//  MNUtilities
//
//  Created by Mohamed Aberkane on 05/02/2021.
//

import Foundation

public extension Date {
    
    var dayTla: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from: self)
    }
    
    var monthTla: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }
    
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self)
    }
    
    var mediumDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
    
    var endOfDay: Date {
        Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: self)!
    }
    
    var yesterday: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: Date().noon)!
    }
    
    var tomorrow: Date {
        Date().noon.adding(value: 1, component: .day)
    }
    
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    
    var isToday: Bool {
        self.isSameDay()
    }
    
    var isYesterday: Bool {
        self.isSameDay(as: yesterday)
    }
    
    func isSameDay(as date: Date = Date()) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: date)
    }
    
    var startOfMonth: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: self)
        return  calendar.date(from: components)!
    }
    
    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: self.startOfMonth)!
    }
    
    func subtract(value: Int, component: Calendar.Component) -> Date {
        Calendar.current.date(byAdding: component, value: -value, to: self)!
    }
    
    func adding(value: Int, component: Calendar.Component) -> Date {
        Calendar.current.date(byAdding: component, value: value, to: self)!
    }
    
    var twoYearsDates: [Date] {
        let aYearAgo = self.startOfMonth.subtract(value: 1, component: .year)
        let aYearLater = self.endOfMonth.adding(value: 1, component: .year)
        return Date.dates(from: aYearAgo, to: aYearLater)
    }
    
    static func dates(from startDate: Date, to toDate: Date) -> [Date] {
        var dates: [Date] = []
        var date = startDate
        
        while date <= toDate {
            dates.append(date)
            guard
                let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date)
            else { break }
            date = newDate
        }
        return dates
    }
}
