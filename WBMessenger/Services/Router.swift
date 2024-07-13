//
//  Router.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/16/24.
//

import SwiftUI

enum TabRoute: Hashable {
    case contacts
    case chats
    case settings
}

enum Route: Hashable {
    case walkthrough
    case authorization
    case main
}

final class Router: ObservableObject {
    @Published var startScreen: Route = .walkthrough
    @Published var selectedTabRoute: TabRoute = .contacts
    
    @Published var path = NavigationPath()
    
    @ViewBuilder func tabView(for route: TabRoute) -> some View {
            switch route {
            case .contacts:
                ContactsView()
                    .navigationBarBackButtonHidden()
            case .chats:
                ChatsView()
                    .navigationBarBackButtonHidden()
            case .settings:
                SettingsView()
                    .navigationBarBackButtonHidden()
            }
    }
    
    @ViewBuilder func view(for route: Route) -> some View {
            switch route {
            case .walkthrough:
                WalkthroughView()
                    .navigationBarBackButtonHidden()
            case .authorization:
                InputPhoneNumberView()
                    .navigationBarBackButtonHidden()
            case .main:
                tabView(for: selectedTabRoute)
            }
    }
    
    func navigateTo(_ appRoute: Route) {
        path.append(appRoute)
    }
        
    func navigateBack() {
        path.removeLast()
    }
        
    func popToRoot() {
        path.removeLast(path.count)
    }
}
