//
//  Date+Extensions.swift
//  AppmazoKit
//
//  Created by James Hickman on 5/19/18.
//  Copyright © 2018 Appmazo, LLC. All rights reserved.
//

import Foundation

public extension Date {
    /**
     Calculate the difference in between two dates.
     
     - parameter date: The date to compare against.
     - returns: Number of years between the two dates.
     */
    public func years(fromDate date: Date) -> Int? {
        return Calendar.current.dateComponents([.year], from: date, to: self).year
    }
    
    /**
     Calculate the difference in between two dates.
     
     - parameter date: The date to compare against.
     - returns: Number of months between the two dates.
     */
    public func months(fromDate date: Date) -> Int? {
        return Calendar.current.dateComponents([.month], from: date, to: self).month
    }
    
    /**
     Calculate the difference in between two dates.
     
     - parameter date: The date to compare against.
     - returns: Number of weeks between the two dates.
     */
    public func weeks(fromDate date: Date) -> Int? {
        return Calendar.current.dateComponents([.weekOfYear], from: date, to: self).weekOfYear
    }
    
    /**
     Calculate the difference in between two dates.
     
     - parameter date: The date to compare against.
     - returns: Number of days between the two dates.
     */
    public func days(fromDate date: Date) -> Int? {
        return Calendar.current.dateComponents([.day], from: date, to: self).day
    }
    
    /**
     Calculate the difference in between two dates.
     
     - parameter date: The date to compare against.
     - returns: Number of hours between the two dates.
     */
    public func hours(fromDate date: Date) -> Int? {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour
    }
    
    /**
     Calculate the difference in between two dates.
     
     - parameter date: The date to compare against.
     - returns: Number of minutes between the two dates.
     */
    public func minutes(fromDate date: Date) -> Int? {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute
    }
    
    /**
     Calculate the difference in between two dates.
     
     - parameter date: The date to compare against.
     - returns: Number of seconds between the two dates.
     */
    public func seconds(fromDate date: Date) -> Int? {
        return Calendar.current.dateComponents([.second], from: date, to: self).second
    }
        
    /// Convert Date to String
    public func convertToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let newDate: String = dateFormatter.string(from: self) // pass Date here
        
        return newDate
    }
    
    /// Convert Date to pretty string (Jan 1, 1970)
    public func prettyStringFromDate() -> String {
        guard let daysFromNow = (Calendar.current as NSCalendar).components(.day, from: Date(), to: self, options: []).day else {
            return ""
        }
        
        let dateFormatter = DateFormatter()
        if daysFromNow == 0 { // Today
            dateFormatter.dateFormat = "h:mm a"
        }
        else {
            dateFormatter.dateFormat = "MMM d, YYYY"
        }
        
        return dateFormatter.string(from: self)
    }
}
