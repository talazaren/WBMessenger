//
//  Router.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/16/24.
//

import Foundation

enum Route: Hashable {
    case contacts
    case chats
    case settings
}

final class Router: ObservableObject {
    @Published var selectedRoute: Route = .contacts
}
