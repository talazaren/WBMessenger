//
//  VerificationViewModel.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 7/16/24.
//

import Foundation
import Combine

final class VerificationViewModel: ObservableObject {
    @Published var generatedCode: String = ""
    @Published var isCodeCorrect: Bool = false
    @Published var inputCode: String = "" {
        didSet {
            if inputCode.count == 4 {
                if verifyCode(inputCode: inputCode) {
                    isCodeCorrect = true
                } else {
                    inputCode = ""
                }
            }
        }
    }
    
    private var codeSequence: CodeSequence
    
    init() {
        codeSequence = CodeSequence(length: 4)
        var iterator = codeSequence.makeIterator()
        generatedCode = iterator.next() ?? ""
        print("Generated Code (for testing): \(generatedCode)")
    }
    
    private func verifyCode(inputCode: String) -> Bool {
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
    var isGenerated = false
    
    mutating func next() -> String? {
        guard !isGenerated else { return nil }
        isGenerated = true
        
        var code = ""
        for _ in 0..<length {
            code += String(Int.random(in: 0...9))
        }
        
        return code
    }
}
