//
//  Additions.swift
//  CalendarLogic
//
//  Created by Happiest Minds on 01/06/15.
//  Copyright (c) 2015 Lancy. All rights reserved.
//

import Foundation

extension NSDate {
   
    var startOfDay: NSDate {
        let components = self.components
        
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        return NSCalendar.currentCalendar().dateFromComponents(components)!
    }
    
    var endOfTheDay: NSDate {
        let components = self.components
        
        components.hour = 23
        components.minute = 59
        components.second = 59
        
        return NSCalendar.currentCalendar().dateFromComponents(components)!
    }

    var firstDayOfTheMonth: NSDate {
        var date: NSDate?
        NSCalendar.currentCalendar().rangeOfUnit(.CalendarUnitMonth, startDate:&date , interval: nil, forDate: self)
        return date!
    }

    var firstDayOfPreviousMonth: NSDate {
        return firstDay(false)
    }
    
    var firstDayOfFollowingMonth: NSDate {
        return firstDay(true)
    }
    
    var monthDayAndYearComponents: NSDateComponents {
        let components: NSCalendarUnit = .CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay
        return NSCalendar.currentCalendar().components(components, fromDate: self)
    }
    
    var weekDay: Int {
        return components.weekday
    }
    
    var numberOfDaysInMonth: Int {
        return NSCalendar.currentCalendar().rangeOfUnit(.CalendarUnitDay, inUnit: .CalendarUnitMonth, forDate: self).length
    }
    
    //MARK: Private variable and methods.
    
    private var components: NSDateComponents {
        let calendarUnit = NSCalendarUnit(UInt.max)
        let components = NSCalendar.currentCalendar().components(calendarUnit, fromDate: self)
        return components
    }
    
    private func firstDay(followingMonth: Bool) -> NSDate {
        let dateComponent = NSDateComponents()
        dateComponent.month = followingMonth ? 1: -1
        
        let date = NSCalendar.currentCalendar().dateByAddingComponents(dateComponent, toDate: self, options: NSCalendarOptions(0))
        return date!.firstDayOfTheMonth
    }
}
