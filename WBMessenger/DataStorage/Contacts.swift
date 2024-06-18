//
//  Contacts.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/16/24.
//

import Foundation

final class Contacts {
    static let shared = Contacts()
    
    let contacts: [Contact] = [
        Contact(
            name: "Анастасия",
            surname: "Иванова",
            avatar: <#T##String#>,
            phoneNumber: <#T##Int#>,
            onlineStatus: <#T##Date#>,
            haveStories: <#T##Bool#>,
            socialMediaLinks: <#T##[SocialMedia]#>
        )
    ]
    
    private init() {}
}
