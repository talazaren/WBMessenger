//
//  SearchBarView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/18/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var inputText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("GreyColor"))
                .padding(.horizontal, 6)
            TextField("Search", text: $inputText)
                .textFieldStyle(PlainTextFieldStyle())
            
        }
        .padding(8)
        .background(Color("InputColor"))
        .cornerRadius(4)
    }
}

