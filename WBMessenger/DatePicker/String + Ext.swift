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
}

