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
            ContactsView().tabItem { Image("Contacts")
                    .foregroundStyle(Color("ActiveColor"))
            }.tag(0)
            ChatsView().tabItem { Image("Chats") }.tag(1)
            SettingsView().tabItem { Image("Settings") }.tag(2)
        }
    }
}

#Preview {
    ContentTabView()
}
