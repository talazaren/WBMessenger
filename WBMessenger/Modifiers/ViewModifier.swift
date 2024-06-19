//
//  ViewModifier.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/19/24.
//

import Foundation
import SwiftUI

struct CustomTabBarStyle: ViewModifier {
    var activeColor: Color
    var inactiveColor: Color

    func body(content: Content) -> some View {
        content
            .modifier(TabBarColorModifier(activeColor: activeColor, inactiveColor: inactiveColor))
    }
}

struct TabBarColorModifier: ViewModifier {
    var activeColor: Color
    var inactiveColor: Color

    func body(content: Content) -> some View {
        content
            .tabViewStyle(DefaultTabViewStyle())
            .foregroundColor(Color.accentColor)
            .accentColor(activeColor)
            .modifier(HighlightableTabBarStyle(activeColor: activeColor, inactiveColor: inactiveColor))
    }
}

struct HighlightableTabBarStyle: ViewModifier {
    var activeColor: Color
    var inactiveColor: Color

    func body(content: Content) -> some View {
        content
            .onAppear {
                UITabBar.appearance().unselectedItemTintColor = UIColor(inactiveColor)
            }
    }
}
