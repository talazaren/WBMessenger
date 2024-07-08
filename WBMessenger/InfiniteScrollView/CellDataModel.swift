//
//  CellDataModel.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 7/8/24.
//

import Foundation
import SwiftUI

struct CellData: Identifiable, Equatable {
    let id = UUID()
    let emoji: String
    
    static func generateRandomEmoji() -> CellData {
        let emoji = String(UnicodeScalar(Array(0x1F300...0x1F3F0).randomElement()!)!)
        return CellData(emoji: emoji)
    }
}
