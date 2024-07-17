//
//  VerificationViewModel.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 7/16/24.
//

import Foundation
import Combine

final class VerificationViewModel: ObservableObject {
    @Published var generatedCode: String = "😇"
    
    private var codeSequence: CodeSequence
    private var iterator: CodeIterator
    
    init() {
        codeSequence = CodeSequence(length: 4)
        iterator = codeSequence.makeIterator()
    }
    
    func generateCode() {
        generatedCode = iterator.next() ?? "🫡"
        print("Generated code: \(generatedCode)")
    }
    
    func verifyCode(inputCode: String) -> Bool {
        return inputCode == generatedCode
    }
}

struct CodeSequence: Sequence {
    let length: Int
    
    func makeIterator() -> CodeIterator {
        return CodeIterator(length: length)
    }
}

struct CodeIterator: IteratorProtocol {
    let length: Int
    
    mutating func next() -> String? {
        var code = ""
        for _ in 0..<length {
            code += String(Int.random(in: 0...9))
        }
        
        return code
    }
}
