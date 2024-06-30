//
//  DateModel.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/29/24.
//

import Foundation

struct DayLocalization: Identifiable {
    let id = UUID()
    let russian: String
    let english: String
    let french: String
    let italian: String
    let japanese: String
    
    func localizedName(for language: Language) -> String {
            switch language {
            case .russian: return russian
            case .english: return english
            case .french: return french
            case .italian: return italian
            case .japanese: return japanese
            }
        }
}


