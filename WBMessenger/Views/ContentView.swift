//
//  ContentView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/5/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            router.view(for: .walkthrough)
                .navigationDestination(for: Route.self) { view in
                    router.view(for: view)
                }
        }
        .environmentObject(router)
    }
}

#Preview {
    ContentView()
}
