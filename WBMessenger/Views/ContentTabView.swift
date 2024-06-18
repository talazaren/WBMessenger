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
                    .renderingMode(router.selectedRoute == .contacts ? .template : .original)
            }.tag(Route.contacts)
            ChatsView().tabItem {
                Image("Chats")
                    .renderingMode(router.selectedRoute == .chats ? .template : .original)
            }.tag(Route.chats)
            SettingsView().tabItem {
                Image("Settings")
                    .renderingMode(router.selectedRoute == .settings ? .template : .original)
            }.tag(Route.settings)
        }
        .tint(Color("ActiveColor"))
        .toolbarBackground(.visible, for: .tabBar)
        .background(Color("BackgroundColor"))
        .shadow(color: Color.black.opacity(0.04), radius: 24, x: 0, y: 1)
    }
}
