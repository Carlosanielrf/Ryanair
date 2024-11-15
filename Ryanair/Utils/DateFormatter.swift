//
//  DateFormatter.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Foundation

final class DateFormatterUtils {
    
    private let hoursAndMinutes = "HH:mm"
    private let hoursHMinutes = "HHH'm'"
    private let formatYYYYMMDD = "yyyy-MM-dd"
    private let iso8601FormatWithoutMillis = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    private var languageCode: String? {
        return (Locale.current as NSLocale).object(forKey: .languageCode) as? String
    }
    
    func getHHMMFrom(
        value: String
    ) -> String {
        
        if let languageCode = self.languageCode {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: languageCode)
            dateFormatter.dateFormat = iso8601FormatWithoutMillis
            let fullDate = dateFormatter.date(from: value) ?? Date()
            return getHHMMFrom(date: fullDate)
        }
        
        return String()
    }
    
    func getHHMMFrom(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = hoursAndMinutes
        return dateFormatter.string(from: date)
    }
    
    func getYYYYMMDDFrom(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatYYYYMMDD
        return dateFormatter.string(from: date)
    }
}
