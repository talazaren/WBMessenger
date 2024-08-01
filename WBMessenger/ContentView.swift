//
//  ContentView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/5/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var system = System()
    @State private var isRemove = false
    
    var body: some View {
        VStack {
            Button(action: {
                isRemove = false
                let newClient = Client()
                system.addClient(newClient)
            }) {
                Text("Добавить клиента")
                    .font(.headline)
                    .padding(10)
                    .frame(width: 250)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Button(action: {
                let tasks = [
                    SuperTask(description: "Задача 1"),
                    SuperTask(description: "Задача 2"),
                    SuperTask(description: "Задача 3")
                ]
                Task {
                    await system.distributeTasks(tasks: tasks)
                }
            }) {
                Text("Распределить задачи")
                    .font(.headline)
                    .padding(10)
                    .frame(width: 250)
                    .background(Color.green)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
            }
            Button {
                withAnimation {
                    system.removeClients()
                    isRemove.toggle()
                }
            } label: {
                Image(systemName: isRemove ? "checkmark": "trash.fill")
                    .font(.largeTitle)
            }
            .contentTransition(.symbolEffect(.replace))
            .padding()
            
        }
    }
}

#Preview {
    ContentView()
}
