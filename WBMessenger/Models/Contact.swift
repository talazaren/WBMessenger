//
//  Contact.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/16/24.
//

import Foundation

struct Contact {
    let id = UUID()
    let name: String
    let surname: String
    let avatar: String
    let phoneNumber: Int
    let onlineStatus: Date
    let haveStories: Bool
    let socialMediaLinks: [SocialMedia]
    
    var fullname: String {
        "\(name) \(surname)"
    }
    
    var onlineStatusMessage: String {
        let timeDifference = Calendar.current.dateComponents([.minute, .hour, .day], from: onlineStatus, to: Date())
        guard let seconds = timeDifference.second else { return "error" }
        
        switch seconds {
        case 0...10:
            return "Online"
        case 11...60:
            return "Last seen \(seconds) seconds ago"
        case 61...3600:
            return "Last seen \(seconds / 60) minutes ago"
        case 3601...86400:
            return "Last seen \(seconds / 60 / 60) hours ago"
        case 86401...172800:
            return "Last seen yesterday"
        default:
            return "Last seen on \(onlineStatus.dateToString(date: onlineStatus))"
        }
    }
    
}

struct SocialMedia {
    let name: SocialMediaName
    let link: String
    let image: String
}

enum SocialMediaName {
    case twitter
    case instagram
    case linkedIn
    case facebook
}


