//
//  ContentTabView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/16/24.
//

import SwiftUI

struct ContentTabView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        TabView(selection: $router.selectedRoute) {
            ContactsView().tabItem {
                Image("Contacts")
                    .renderingMode(.template)
            }.tag(Route.contacts)
            ChatsView().tabItem {
                Image("Chats")
                    .renderingMode(.template)
            }.tag(Route.chats)
            SettingsView().tabItem {
                Image("Settings")
                    .renderingMode(.template)
            }.tag(Route.settings)
        }
        .modifier(CustomTabBarStyle(activeColor: Color("ActiveColor"), inactiveColor: Color("TextColor")))
        .toolbarBackground(.visible, for: .tabBar)
        .shadow(color: Color.black.opacity(0.04), radius: 24, x: 0, y: 1)
    }
}
