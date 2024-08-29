//
//  InputPhoneNumberView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 7/10/24.
//

import SwiftUI
import UISystem

struct InputPhoneNumberView: View {
    @EnvironmentObject var router: Router
    
    @State private var phoneNumber: String = ""
    @State private var selectedCountryCode: CountryCode = CountryCode.countryCodes.first!
    @State private var isAnimating = false
    
    private let dynamicButtonTitle = "Continue"
    
    private var isEqual: Bool {
        let numberCount = countDigits(in: selectedCountryCode.phoneFormat)
        let inputNumberCount = phoneNumber.count
        let result = numberCount == inputNumberCount
        
        return result
    }
    
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
                    withAnimation(.default) {
                        buttonAction()
                    } completion: {
                        isAnimating = false
                    }
                }, buttonText: Text(LocalizedStringKey(dynamicButtonTitle)))
                .opacity(isEqual ? 1 : 0.5)
                .padding(.bottom, 20)
                .offset(x: isAnimating ? -10 : 0)
                .animation(isAnimating ? .easeInOut(duration: 0.1).repeatCount(5) : .easeInOut(duration: 0.1).repeatCount(1), value: isAnimating)

            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationBackButton(action: {
                        router.navigateBack()
                    })
                }
            }
            .background(Color("BackgroundColor"))
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
                .padding(.horizontal, 8)
                .font(.bodyText1())
                .foregroundStyle(Color("GreyColor"))
                .background(Color("InputColor"))
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .onChange(of: phoneNumber) { newValue, _ in
                    let limit = countDigits(in: selectedCountryCode.phoneFormat)
                    if newValue.count >= limit {
                        phoneNumber = String(newValue.prefix(limit))
                    }
                }
        }
        .padding(.horizontal, 24)
        .padding(.top, 50)
    }
    
    private func countDigits(in phoneFormat: String) -> Int {
        let digitRegex = try! Regex("[0]")
        let matches = phoneFormat.matches(of: digitRegex)
            
        return matches.count
    }
    
    private func buttonAction() {
        switch isEqual {
        case true:
            router.navigateTo(.verification(phoneNumber: phoneNumber, code: selectedCountryCode))
        case false:
            isAnimating.toggle()
        }
        
    }
}


#Preview {
    InputPhoneNumberView()
}
