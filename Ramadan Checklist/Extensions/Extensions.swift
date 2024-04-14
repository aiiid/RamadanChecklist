//
//  Extensions.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 14/03/2024.
//

import UIKit
//MARK: - Color extension
extension UIColor {
  convenience init?(hexString: String) {
    guard let rgbValue = UInt64(hexString.trimmingCharacters(in: .whitespacesAndNewlines), radix: 16) else { return nil }
    let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
    let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
    let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
    self.init(red: red, green: green, blue: blue, alpha: 1.0)
  }
}

//MARK: Date extension
extension Date{
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
