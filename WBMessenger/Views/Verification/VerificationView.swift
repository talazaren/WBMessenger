//
//  VerificationView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 7/16/24.
//

import SwiftUI

struct VerificationView: View {
    @ObservedObject var viewModel = VerificationViewModel()
    @State var isCodeCorrect: Bool = false
    @State var inputCode: String = "" {
        didSet {
            print(inputCode)
            if inputCode.count == 4 {
                if viewModel.verifyCode(inputCode: inputCode) {
                    isCodeCorrect = true
                } else {
                    inputCode = ""
                }
            }
        }
    }
    
    let phoneNumber: String
    let countryCode: CountryCode
    
    var body: some View {
        VStack {
            Text("Enter a code")
                .font(.heading2())
                .foregroundStyle(Color("TextColor"))
                .padding(.bottom, 8)
            
            Text("Code was sent to number \n \(countryCode.code) \(phoneNumber)")
                .font(.bodyText2())
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("TextColor"))
                .frame(height: 48)
                .lineSpacing(8)
                .padding(.top, 8)
            
            InputCodeView(inputCode: $inputCode, isCodeCorrect: $isCodeCorrect)
            
            Spacer()
            
            Button(action: {
                viewModel.generateCode()
            }, label: {
                Text("Request code again")
                    .font(.subheading2())
            })
            .frame(height: 52)
            .padding(.bottom, 20)
        }
        .onAppear(perform: {
            viewModel.generateCode()
        })
    }
}

#Preview {
    VerificationView(phoneNumber: "999 999 99 99", countryCode: CountryCode(code: "+7", country: "Russia", phoneFormat: ""))
}
