//
//  ButtonView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/5/24.
//

import SwiftUI

public struct ButtonView: View {
    let buttonAction: () -> Void
    let buttonText: Text
    
    public init(buttonAction: @escaping () -> Void, buttonText: Text) {
        self.buttonAction = buttonAction
        self.buttonText = buttonText
    }
    
    public var body: some View {
        Button(action: buttonAction) {
            buttonText
                .font(.subheading2())
                .frame(width: 327, height: 52)
                .background(Color("AccentColor"))
                .foregroundStyle(Color("OffWhiteColor"))
                .cornerRadius(30)
        }
    }
}

