//
//  VerificationView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 7/16/24.
//

import SwiftUI

struct VerificationView: View {
    @ObservedObject var viewModel = VerificationViewModel()
    @State private var isNavigationActive = false
    
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
            
            InputCodeView(inputCode: $viewModel.inputCode)
            
            Spacer()
        }
    }
}

#Preview {
    VerificationView(phoneNumber: "999 999 99 99", countryCode: CountryCode(code: "+7", country: "Russia", phoneFormat: ""))
}
