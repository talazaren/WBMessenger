//
//  DistributedSystem.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 8/1/24.
//

import SwiftUI
import Combine

final class SuperTask {
    let id: UUID
    let description: String
    
    init(description: String) {
        self.id = UUID()
        self.description = description
    }
}

enum ProcessError: Error {
    case taskFailed(String)
}

final class Client: ObservableObject {
    let id: UUID
    var system: System?
    
    init() {
        self.id = UUID()
    }
    
    // Метод обработки задачи с возможностью возникновения ошибки
    func process(task: SuperTask) async throws -> String {
        // С вероятностью 10% выбрасываем ошибку
        let isError = Int.random(in: 1...10) == 1
            
        if isError {
            throw ProcessError.taskFailed("❗️Ошибка обработки задачи: \(task.description)")
        }
            
        // Имитируем обработку задачи с задержкой 1 секунда
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        return "✅ Клиент \(id.uuidString.prefix(4)) обработал задачу: \(task.description)"
    }
}

final class System: ObservableObject {
    @Published private(set) var clients: [Client] = []
    
    func addClient(_ client: Client) {
        clients.append(client)
        print("👤 Клиент \(client.id.uuidString.prefix(4)) добавлен")
    }
    
    // Распределяем задачи
    func distributeTasks(tasks: [SuperTask]) async {
        for (index, task) in tasks.enumerated() {
            let clientIndex = index % clients.count
            let client = clients[clientIndex]
            await attemptTaskProcessing(client: client, task: task, retryCount: 3)
        }
    }
    
    // Выполняем попытку обработки задачи с определенным количеством повторных попыток
    private func attemptTaskProcessing(client: Client, task: SuperTask, retryCount: Int) async {
        var attempts = 0
        var success = false
        
        while attempts < retryCount && !success {
            attempts += 1
            do {
                let result = try await client.process(task: task)
                print(result)
                success = true
            } catch {
                print("🚫 Ошибка обработки задачи: \(error). Попытка \(attempts) из \(retryCount)...")
                if attempts == retryCount {
                    print("😭 Все попытки завершились неудачно для задачи: \(task.description)")
                }
            }
        }
    }
}

