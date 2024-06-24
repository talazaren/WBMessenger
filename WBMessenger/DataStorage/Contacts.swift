//
//  Contacts.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/16/24.
//

import Foundation

final class Contacts {
    static let shared = Contacts()
    
    var currentIndex = 0
    
    let contacts: [Contact] = [
        Contact(
            name: "Анастасия",
            surname: "Иванова",
            avatar: "Anastasia",
            phoneNumber: "+7 999 999-99-99",
            onlineStatus: Date(timeIntervalSinceNow: -30 * 3600),
            haveStories: false,
            socialMediaLinks: [
                SocialMedia(name: .facebook, link: "https://www.facebook.com/", image: "Facebook"),
                SocialMedia(name: .instagram, link: "https://www.instagram.com/", image: "Instagram"),
                SocialMedia(name: .twitter, link: "https://x.com/", image: "X")
            ]
        ),
        Contact(
            name: "Петя",
            surname: nil,
            avatar: "Peter",
            phoneNumber: "+7 999 999-99-99",
            onlineStatus: Date(timeIntervalSinceNow: -5),
            haveStories: false,
            socialMediaLinks: [
                SocialMedia(name: .facebook, link: "https://www.facebook.com/", image: "Facebook"),
                SocialMedia(name: .instagram, link: "https://www.instagram.com/", image: "Instagram"),
                SocialMedia(name: .twitter, link: "https://x.com/", image: "X"),
                SocialMedia(name: .linkedIn, link: "https://linkedin.com/", image: "LinkedIn")
            ]
        ),
        Contact(
            name: "Маман",
            surname: nil,
            avatar: "Mum",
            phoneNumber: "+7 999 999-99-99",
            onlineStatus: Date(timeIntervalSinceNow: -3 * 3600),
            haveStories: true,
            socialMediaLinks: [
                SocialMedia(name: .facebook, link: "https://www.facebook.com/", image: "Facebook"),
                SocialMedia(name: .instagram, link: "https://www.instagram.com/", image: "Instagram")
            ]
        ),
        Contact(
            name: "Арбуз",
            surname: "Дыня",
            avatar: "Arbuz",
            phoneNumber: "+7 999 999-99-99",
            onlineStatus: Date(timeIntervalSinceNow: -3),
            haveStories: false,
            socialMediaLinks: [
                SocialMedia(name: .instagram, link: "https://www.instagram.com/", image: "Instagram"),
                SocialMedia(name: .twitter, link: "https://x.com/", image: "X"),
                SocialMedia(name: .linkedIn, link: "https://linkedin.com/", image: "LinkedIn")
            ]
        ),
        Contact(
            name: "Иван",
            surname: "Иванов",
            avatar: nil,
            phoneNumber: "+7 999 999-99-99",
            onlineStatus: Date(timeIntervalSinceNow: -8),
            haveStories: false,
            socialMediaLinks: [
                SocialMedia(name: .facebook, link: "https://www.facebook.com/", image: "Facebook"),
                SocialMedia(name: .linkedIn, link: "https://linkedin.com/", image: "LinkedIn")
            ]
        ),
        Contact(
            name: "Лиса",
            surname: "Алиса",
            avatar: nil,
            phoneNumber: "+7 999 999-99-99",
            onlineStatus: Date(timeIntervalSinceNow: -30 * 60),
            haveStories: true,
            socialMediaLinks: [
                SocialMedia(name: .linkedIn, link: "https://linkedin.com/", image: "LinkedIn")
            ]
        )
    ]
    
    private init() {}
}
