//
//  TimeConvertion.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 15/2/23.
//

import Foundation

class TimeConvertion {
    static let shared = TimeConvertion()
    private init() {}

    // MARK: - Solve long method using Replace Temp With Querry

    func claculteHour(minutes: Double) -> Double {
        round(minutes / 60)
    }

    func calculateDay(minutes: Double) -> Double {
        round(claculteHour(minutes: minutes) / 24)
    }

    /// This method take a string parameter of type date and convert it minutes, hours, and day
    func timeConvert(time: String) -> String {
        if time != " " {
            let minutes = calculateMinutes(time: time)
            if minutes > 59.0 {
                if claculteHour(minutes: minutes) > 23 {
                    return ("\(Int(calculateDay(minutes: minutes))) days ago")
                } else {
                    return ("\(Int(claculteHour(minutes: minutes))) hours ago")
                }
            } else {
                return ("\(Int(minutes)) minutes ago")
            }
        } else {
            return " "
        }
    }

    func calculateMinutes(time: String) -> Double {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: time)
        guard let date = date else { return 0.0 }
        let passedTimeInSecond = Date().timeIntervalSince(date)
        let minutes = round(passedTimeInSecond / 60)
        print(minutes)
        return minutes
    }
    func formatDate(date: String)-> String{
        let inputFormatter = ISO8601DateFormatter()
        inputFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        guard let date = inputFormatter.date(from: date) else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        if Calendar.current.isDateInToday(date){
            dateFormatter.dateFormat = "'Today at' h:mm a"
        }else{
            dateFormatter.dateFormat = "MMMM dd, yyyy"
        }
        return dateFormatter.string(from: date)
    }
}
