//
//  SwiftUIView.swift
//  
//
//  Created by Tatiana Lazarenko on 7/25/24.
//

import SwiftUI

public struct NavigationBackButton: View {
    let action: () -> Void
    
    public init(action: @escaping () -> Void) {
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            HStack {
                Image("Back")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color("TextColor"))
            }
        }
        
    }
}

#Preview {
    NavigationBackButton(action: {})
}
