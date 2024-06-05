//
//  WalkthroughView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/5/24.
//

import SwiftUI

struct WalkthroughView: View {
    @State var showModal = false
    
    var body: some View {
        VStack{
            Image("Illustration")
                .padding(.vertical, 45)
            
            Text("Общайтесь с друзьями и близкими легко")
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button(action: buttonAction, label: {
                Text("Польззовательское соглашение")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.primary)
                    .padding(.bottom, 18)
            })
            
            ButtonView(buttonAction: buttonAction, buttonText: "Начать общаться")
                .sheet(isPresented: $showModal) {
                    ModalView(showModal: $showModal)
                }
                .padding(.bottom, 20)
        }
        .padding(.leading, 40)
        .padding(.trailing, 40)
    
        .background(Color("BackgroundColor"))
    }
    
    private func buttonAction() {
        showModal.toggle()
    }
}

#Preview {
    WalkthroughView(showModal: false)
}
