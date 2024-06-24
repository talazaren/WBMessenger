//
//  AppIntent.swift
//  WBMessengerWidget
//
//  Created by Tatiana Lazarenko on 6/24/24.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}

struct ShowNextContactIntent: AppIntent {
    static var title: LocalizedStringResource = "Show Next Contact"
    static var description = IntentDescription("Show the next contact in the list.")
    
    @Parameter(title: "Current Index")
    var currentIndex: Int
    
    init() {}
    
    init(currentIndex: Int) {
        self.currentIndex = currentIndex
    }
    
    func perform() async throws -> some IntentResult {
        Contacts.shared.currentIndex = currentIndex
        return .result()
    }
}

struct ShowPreviousContactIntent: AppIntent {
    static var title: LocalizedStringResource = "Show Previous Contact"
    static var description = IntentDescription("Show the previous contact in the list.")
    
    @Parameter(title: "Current Index")
    var currentIndex: Int
    
    init() {}
    
    init(currentIndex: Int) {
        self.currentIndex = currentIndex
    }
    
    func perform() async throws -> some IntentResult {
        Contacts.shared.currentIndex = currentIndex
        return .result()
    }
}
