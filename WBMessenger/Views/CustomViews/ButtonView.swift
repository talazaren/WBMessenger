//
//  ButtonView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/5/24.
//

import SwiftUI

struct ButtonView: View {
    let buttonAction: () -> Void
    let buttonText: String
    
    var body: some View {
        Button(action: buttonAction) {
            Text(buttonText)
                .font(.subheading2())
                .frame(width: 327, height: 52)
                .background(Color("AccentColor"))
                .foregroundStyle(Color("OffWhiteColor"))
                .cornerRadius(30)
        }
    }
}

#Preview {
    ButtonView(buttonAction: {}, buttonText: "Начать общаться")
}
