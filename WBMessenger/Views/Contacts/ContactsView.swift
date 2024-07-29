//
//  ContactsView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/16/24.
//

import SwiftUI
import UISystem

struct ContactsView: View {
    @EnvironmentObject var router: Router
    @State private var inputText = ""
    
    let contacts = Contacts.shared.contacts
    
    var filteredContacts: [Contact] {
        inputText.isEmpty ? contacts : contacts.filter { $0.fullname.lowercased().contains(inputText.lowercased())
        }
    }
    
    var body: some View {
        VStack {
            SearchBarView(inputText: $inputText)
                .padding(.horizontal, 24)
                .padding(.top, 106)
            
            List(filteredContacts, id: \.self) { contact in
                ContactRowView(contact: contact)
                    .listRowBackground(Color("BackgroundColor"))
                    .listRowSeparatorTint(Color("InputColor"))
                    .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
                    .alignmentGuide(.listRowSeparatorTrailing) { separator in
                        separator.width - 2
                    }
                    .padding(5)
                    .onTapGesture {
                        router.navigateTo(.contactDetails(contact: contact))
                    }
            }
            .listStyle(.plain)
            
        }
        .background(Color("BackgroundColor"))
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Contacts")
                    .font(.headline)
                    .foregroundStyle(Color("TextColor"))
                    .padding(.leading, 8)
                    .padding(.bottom, 13)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                        
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 14, height: 14)
                        .foregroundStyle(Color("TextColor"))
                        .padding(.trailing, 8)
                        .padding(.bottom, 13)
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    ContentView()
}
