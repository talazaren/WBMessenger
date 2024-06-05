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
                .font(.system(size: 16, weight: .semibold))
                .frame(width: 327, height: 52)
                .background(Color(red: 154/255, green: 65/255, blue: 254/255))
                .foregroundColor(Color.white)
                .cornerRadius(30)
        }
    }
}

#Preview {
    ButtonView(buttonAction: {}, buttonText: "Начать общаться")
}
