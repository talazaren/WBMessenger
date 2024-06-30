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
        VStack {
            Spacer()
            
            ButtonView(buttonAction: {
                showModal.toggle()
            }, buttonText: "Закрыть окно")
            .padding(.bottom, 20)
        }
        .padding(.leading, 40)
        .padding(.trailing, 40)
        .background(Color("BackgroundColor"))
    }
}

#Preview {
    ModalView(showModal: .constant(true))
}
