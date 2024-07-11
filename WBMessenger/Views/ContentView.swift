//
//  ContentView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WalkthroughView()
            .environmentObject(Router())
    }
}

#Preview {
    ContentView()
}
