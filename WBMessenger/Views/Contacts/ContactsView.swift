//
//  ContactsView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/16/24.
//

import SwiftUI

struct ContactsView: View {
    @EnvironmentObject var router: Router
    @State var path = [Contact]()
    @State private var inputText = ""
    
    let contacts = Contacts.shared.contacts
    
    var filteredContacts: [Contact] {
        inputText.isEmpty ? contacts : contacts.filter { $0.fullname.lowercased().contains(inputText.lowercased())
        }
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                SearchBarView(inputText: $inputText)
                    .padding([.trailing, .leading], 24)
                    .padding(.top, 16)
                
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
                            path.append(contact)
                        }
                }
                .listStyle(.plain)
                .navigationDestination(for: Contact.self) { contact in
                    ContactDetailsView(contact: contact)
                        .background(Color("BackgroundColor"))
                    
                }
                
            }
            .background(Color("BackgroundColor"))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Контакты")
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
}
#Preview {
    ContentView()
}