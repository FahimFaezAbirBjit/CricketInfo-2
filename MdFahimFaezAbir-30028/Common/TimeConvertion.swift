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
    func time(date: String)-> String{
        let inputFormatter = ISO8601DateFormatter()
        inputFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        guard let date = inputFormatter.date(from: date) else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        //guard let date = dateFormatter.date(from: date) else {return ""}
        print(date)
        return dateFormatter.string(from: date)
    }
    func timeRemaining(from startDate: Date, to endDate: Date) -> (hours: Int, minutes: Int, seconds: Int) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second], from: startDate, to: endDate)
        
        guard let hours = components.hour,
              let minutes = components.minute,
              let seconds = components.second else {
            return (0, 0, 0)
        }
        return (max(0, hours), max(0, minutes), max(0, seconds))
    }
    func previousDate(prev: Int)->String{
        let currentDate = Date()
        let calendar = Calendar.current
        let previousDay = calendar.date(byAdding: .day, value: prev, to: currentDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let previousDayFormatted = dateFormatter.string(from: previousDay!)
        return previousDayFormatted
    }
    func nextDate(next: Int)->String{
        let currentDate = Date()
        let calendar = Calendar.current
        let nextMonth = calendar.date(byAdding: .day, value: next, to: currentDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let nextFormatted = dateFormatter.string(from: nextMonth!)
        return nextFormatted
    }
    func previousMonth(prev: Int)->String{
        let currentDate = Date()
        let calendar = Calendar.current
        let previousMonth = calendar.date(byAdding: .month, value: prev, to: currentDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let previousMonthFormatted = dateFormatter.string(from: previousMonth!)
        return previousMonthFormatted
    }
    func nextMonth(next: Int)->String{
        let currentDate = Date()
        let calendar = Calendar.current
        let nextMonth = calendar.date(byAdding: .month, value: next, to: currentDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let nextMonthFormatted = dateFormatter.string(from: nextMonth!)
        return nextMonthFormatted
    }
    func currentDate()->String{
        let currentDate = Date()
        _ = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let current = dateFormatter.string(from: currentDate)
        return current
    }
    
}
