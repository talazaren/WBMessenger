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
        formatter.dateFormat = "d MMM yyyy HH:mm"
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
            result.append(getString(from: match.1, via: numberFormatter) + " ")
            result.append(String(match.2) + ", ")
            result.append(getString(from: match.3, via: numberFormatter) + ", \n")
            result.append(getString(from: match.4, via: numberFormatter) + " ")
            result.append(getString(from: match.5, via: numberFormatter))
        } else {
            print("Error")
        }
        
        appendLiteral(result)
    }
    
    private func getString(from match: Substring, via formatter: NumberFormatter) -> String {
        guard let value = formatter.string(from: (Int(match) ?? 0) as NSNumber) else { return "" }
        return value
    }
}
