//
//  ContentView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/5/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var system = System()
        
    var body: some View {
        VStack {
            Button("Добавить клиента") {
                let newClient = Client()
                system.addClient(newClient)
            }
            .padding()
            
            Button("Распределить задачи") {
                let tasks = [
                    SuperTask(description: "Задача 1"),
                    SuperTask(description: "Задача 2"),
                    SuperTask(description: "Задача 3")
                ]
                Task {
                    await system.distributeTasks(tasks: tasks)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
