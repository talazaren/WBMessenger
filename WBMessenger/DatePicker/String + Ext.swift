//
//  String + Ext.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/29/24.
//

import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation(spell value: Int, for locale: Locale) {
            let formatter = NumberFormatter()
            formatter.locale = locale
            formatter.numberStyle = .spellOut
            
            if let result = formatter.string(from: value as NSNumber) {
                appendLiteral(result)
            }
        }
    
    mutating func appendInterpolation(dateFormat value: Date, for locale: Locale) {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy HH:mm:ss"
        formatter.locale = locale
        
        let result = formatter.string(from: value)
        appendLiteral(result)
    }
    
    mutating func appendInterpolation(dateFormatSpellOut value: Date, for locale: Locale) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy HH:mm:ss"
        dateFormatter.locale = locale
        
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = locale
        numberFormatter.numberStyle = .spellOut
        
        let formattedDate = dateFormatter.string(from: value)
        let pattern = /(\d{1,2}) (\w+) (\d{4}) (\d{2}):(\d{2}):\d{2}/
        
        var result = ""
        
        if let match = formattedDate.firstMatch(of: pattern) {
            
            if let day = numberFormatter.string(from: (Int(match.1) ?? 0) as NSNumber) {
                result.append(day)
            }
            result.append(String(match.2))
            if let year = numberFormatter.string(from: (Int(match.3) ?? 0) as NSNumber) {
                result.append(year)
            }
            if let hours = numberFormatter.string(from: (Int(match.4) ?? 0) as NSNumber) {
                result.append(hours)
            }
            if let minutes = numberFormatter.string(from: (Int(match.5) ?? 0) as NSNumber) {
                result.append(minutes)
            }
            
        } else {
            print("Error")
        }
        appendLiteral(result)
    }
}
