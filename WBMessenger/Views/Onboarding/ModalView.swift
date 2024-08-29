//
//  ModalView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/5/24.
//

import SwiftUI
import UISystem

struct ModalView: View {
    @Binding var showModal: Bool
    
    let dynamicButtonTitle = "Close"
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                
                ButtonView(buttonAction: {
                    showModal.toggle()
                }, buttonText: Text(LocalizedStringKey(dynamicButtonTitle)))
                .padding(.bottom, 20)
            }
            .background(Color.clear)
        }
    }
}

#Preview {
    ModalView(showModal: .constant(true))
}
