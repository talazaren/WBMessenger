//
//  ModalView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/5/24.
//

import SwiftUI

struct ModalView: View {
    @Binding var showModal: Bool
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                
                ButtonView(buttonAction: {
                    showModal.toggle()
                }, buttonText: "Закрыть окно")
                .padding(.bottom, 20)
            }
            .background(Color.clear)
        }
    }
}

#Preview {
    ModalView(showModal: .constant(true))
}