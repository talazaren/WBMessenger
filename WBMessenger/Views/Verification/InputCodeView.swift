//
//  InputCodeView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 7/16/24.
//

import SwiftUI

struct InputCodeView: View {
    @EnvironmentObject var router: Router
    @FocusState private var isFocused: Bool
    
    @Binding var inputCode: String
    @Binding var isCodeCorrect: Bool
    
    var body: some View {
        ZStack {
            HStack(spacing: 40) {
                ForEach(0..<4) { index in
                    let isFilled = inputCode.count > index
                    Circle()
                        .fill(Color("CodeColor"))
                        .frame(width: 24, height: 24)
                        .opacity(isFilled ? 0 : 1)
                        .animation(.easeInOut, value: isFilled)
                        .overlay {
                            if isFilled { codeChar(index: index) }
                        }
                }
            }
            .padding(.vertical, 50)
            
            TextField("", text: $inputCode)
                .frame(width: 0, height: 0)
                .opacity(0)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .focused($isFocused)
                .padding()
                .onAppear {
                    isFocused = true
                }
                .onChange(of: isCodeCorrect) {
                    print(isCodeCorrect)
                    if isCodeCorrect {
                        router.navigateTo(.main)
                    }
                }
                
        }
    }
    
    private func codeChar(index: Int) -> some View {
        Text(String(inputCode[index]))
            .font(.heading1())
            .frame(width: 24, height: 24)
            .foregroundStyle(Color("TextColor"))
            .padding(.vertical, 1)
    }
}

