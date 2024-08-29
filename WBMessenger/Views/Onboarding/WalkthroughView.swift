//
//  WalkthroughView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/5/24.
//

import SwiftUI
import UISystem

struct WalkthroughView: View {
    @EnvironmentObject var router: Router
    @State var showModal = false
    
    let dynamicButtonTitle = "Start chatting"
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("Illustration")
                    .padding(.vertical, 45)
                
                Text("Communicate with friends and family easily")
                    .font(.heading2())
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Text("By clicking continue I agree to")
                    .font(.metadata2())
                    .foregroundStyle(Color.gray)
                
                HStack {
                    Button(action: buttonAction, label: {
                        Text("Privacy Policy")
                            .font(.system(size: 10))
                            .foregroundColor(Color("AccentColor"))
                    })
                    
                    Text("and")
                        .font(.metadata2())
                        .foregroundStyle(Color.gray)
                    
                    Button(action: buttonAction, label: {
                        Text("Terms of Use")
                            .font(.metadata2())
                            .foregroundColor(Color("AccentColor"))
                    })
                }
                .padding(.bottom, 10)
                
                ButtonView(buttonAction: {
                    router.navigateTo(.authorization)
                }, buttonText: Text(LocalizedStringKey(dynamicButtonTitle)))
                .padding(.bottom, 20)
            }
            .background(Color.clear)
        }
    }
    
    private func buttonAction() {
        showModal.toggle()
    }
}

#Preview {
    WalkthroughView(showModal: false)
}