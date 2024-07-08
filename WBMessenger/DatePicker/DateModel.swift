//
//  DateModel.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/29/24.
//

import Foundation

enum Language: String, CaseIterable, Identifiable {
    case russian = "ru"
    case english = "eng"
    case french = "fr"
    case italian = "it"
    case japanese = "jp"
    
    var id: String { self.rawValue }
    
    var displayName: String {
        switch self {
        case .russian: return "RU 🇷🇺"
        case .english: return "ENG 🇺🇸"
        case .french: return "FR 🇫🇷"
        case .italian: return "IT 🇮🇹"
        case .japanese: return "JP 🇯🇵"
        }
    }
    
    var locale: Locale {
        switch self {
        case .russian: return Locale(identifier: "ru_RU")
        case .english: return Locale(identifier: "en_US")
        case .french: return Locale(identifier: "fr_FR")
        case .italian: return Locale(identifier: "it_IT")
        case .japanese: return Locale(identifier: "ja_JP")
        }
    }
}

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


