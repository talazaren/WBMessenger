//
//  Router.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/16/24.
//

import Foundation

enum Routes: Hashable {
    case contacts
    case chats
    case settings
    case contactDetails
}

final class Router: ObservableObject {
    @Published var selectedRoute: Routes = .contacts
}
