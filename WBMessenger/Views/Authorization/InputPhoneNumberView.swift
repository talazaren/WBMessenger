//
//  InputPhoneNumberView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 7/10/24.
//

import SwiftUI

struct InputPhoneNumberView: View {
    @EnvironmentObject var router: Router
    
    @State private var phoneNumber: String = ""
    @State private var selectedCountryCode: CountryCode = CountryCode.countryCodes.first!

    private var isButtonActive = false
    
        var body: some View {
            VStack {
                Text("Enter your phone number")
                    .font(.heading2())
                    .foregroundStyle(Color("TextColor"))
                    .frame(height: 29)
                    .padding(.top, 80)

                Text("We will send a confirmation code\nto the specified number")
                    .font(.bodyText2())
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("TextColor"))
                    .frame(height: 48)
                    .lineSpacing(8)
                    .padding(.top, 8)

                inputPhoneNumber
                
                Spacer()

                ButtonView(buttonAction: {
                    
                }, buttonText: "Continue")
                .opacity(isButtonActive ? 1 : 0.5)
                .padding(.bottom, 20)

            }
            .onTapGesture {
                hideKeyboard()
            }
        }
}

extension InputPhoneNumberView {
    private var inputPhoneNumber: some View {
        HStack {
            Menu {
                Picker("", selection: $selectedCountryCode) {
                    ForEach(CountryCode.countryCodes, id: \.self) { country in
                        HStack {
                            Text(country.code)
                                .font(.bodyText1())
                            Image(country.country)
                                .resizable()
                                .frame(width: 16, height: 16)
                        }.tag(country)
                    }
                }
            } label: {
                HStack {
                    Image(selectedCountryCode.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 16, height: 16)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .padding(.leading, 8)
                    Text(selectedCountryCode.code)
                        .font(.bodyText1())
                        .foregroundStyle(Color("GreyColor"))
                        .padding(.trailing, 8)
                }
                .frame(height: 36)
                .background(Color("InputColor"))
                .clipShape(RoundedRectangle(cornerRadius: 4))
            }
            
            TextField(selectedCountryCode.phoneFormat, text: $phoneNumber)
                .keyboardType(.numberPad)
                .frame(height: 36)
                .font(.bodyText1())
                .foregroundStyle(Color("GreyColor"))
                .background(Color("InputColor"))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        .padding(.horizontal, 24)
        .padding(.top, 50)
    }
}


#Preview {
    InputPhoneNumberView()
}
