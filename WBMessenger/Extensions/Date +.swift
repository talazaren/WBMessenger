//
//  Date + Ext.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/18/24.
//

import Foundation

extension Date {
    func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
}
