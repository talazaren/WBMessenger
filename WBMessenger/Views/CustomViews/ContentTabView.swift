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
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                Spacer()
                switch router.selectedTabRoute {
                case .contacts:
                    ContactsView()
                case .chats:
                    ChatsView()
                case .settings:
                    SettingsView()
                }
                Spacer()
            }
            CustomTabBarView()
        }
        .ignoresSafeArea(.container)
    }
}

struct CustomTabBarView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        HStack {
            TabItemView(screen: .contacts, icon: "Contacts")
            Spacer()
            TabItemView(screen: .chats, icon: "Chats")
            Spacer()
            TabItemView(screen: .settings, icon: "Settings")
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 40)
        .padding(.top, 20)
        .background(
            Color("BackgroundColor").shadow(color: .black.opacity(0.04), radius: 24, x: -1)
        )
    }
}
        
struct TabItemView: View {
    @EnvironmentObject var router: Router
    let screen: TabRoute
    let icon: String
    
    var body: some View {
        Button(action: {
            router.selectedTabRoute = screen
        }, label: {
            Image(icon)
                .renderingMode(.template)
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(router.selectedTabRoute == screen ? Color("ActiveColor") : Color("TextColor"))
            }
        )
    }
}
