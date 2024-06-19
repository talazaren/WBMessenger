//
//  ContactDetailsView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/16/24.
//

import SwiftUI

struct ContactDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    let contact: Contact
    
    var body: some View {
        VStack {
            ProfileImageView(contact: contact)
                .padding(.bottom, 20)
            
            Text(contact.fullname)
                .font(.system(size: 24))
                .foregroundStyle(Color("TextColor"))
                .fontWeight(.bold)
                .frame(height: 24)
            
            Text(contact.phoneNumber)
                .font(.system(size: 16))
                .foregroundStyle(Color("GreyColor"))
                .fontWeight(.semibold)
                .frame(height: 20)
            
            SocialMediaLinksView(contact: contact)
                .padding(.top, 40)
        }
        .padding(.top, 46)
        .padding([.leading, .trailing], 100)
        .background(Color("BackgroundColor"))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image("Back")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(Color("TextColor"))
                        Text("Профиль")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(Color("TextColor"))
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                   
                }) {
                    Image("Pen")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color("TextColor"))
                }
            }
        }
        Spacer()
    }
}

struct ProfileImageView: View {
    let contact: Contact
    
    var body: some View {
        if let image = contact.avatar {
            Image(image)
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
        } else {
            ZStack{
                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(Color("InputColor"))
                Image("Avatar")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 112, height: 112)
                    .foregroundStyle(Color("TextColor"))
            }
        }
    }
}

struct SocialMediaLinksView: View {
    let contact: Contact
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(contact.socialMediaLinks, id: \.self) { link in
                if let url = URL(string: link.link) {
                    Link(destination: url) {
                        Image(link.image)
                    }
                }
            }
        }
    }
}

#Preview {
    ContactDetailsView(contact: Contact(name: "Anne", surname: "Das", avatar: nil, phoneNumber: "+456", onlineStatus: .now, haveStories: true, socialMediaLinks: [SocialMedia(name: .facebook, link: "https://linkedin.com/", image: "LinkedIn")]))
}
