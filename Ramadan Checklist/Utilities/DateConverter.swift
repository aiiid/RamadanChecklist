//
//  DateFormatter.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 14/03/2024.
//

import Foundation

struct DateConverter{
    static func convert(dateString: String) -> (day: Int, weekday: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // Set the input date format

        guard let date = dateFormatter.date(from: dateString) else {
            // Handle date parsing error
            print("Error: Invalid date format")
            return (0, "")
        }

        let calendar = Calendar.current
        // Get day of the month (1-31)
        let day = calendar.component(.day, from: date)
        
        // Get weekday name (e.g., Monday)
        let weekdayFormatter = DateFormatter()
        weekdayFormatter.dateFormat = "EEEE" // EEEE for full weekday name
        let weekday = weekdayFormatter.string(from: date)

        return (day, weekday)
    }
}
