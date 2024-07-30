//
//  ContactRowView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/18/24.
//

import SwiftUI
import UISystem

struct ContactRowView: View {
    let contact: Contact
    
    var body: some View {
        HStack(spacing: 12) {
            AvatarView(contact: contact)
                
            VStack(alignment: .leading, spacing: 2) {
                Text(contact.fullname)
                    .font(.bodyText1())
                    .foregroundStyle(Color("TextColor"))
                    .frame(height: 24)
                        
                Text(contact.onlineStatusMessage)
                    .font(.metadata1())
                    .foregroundStyle(Color("GreyColor"))
                    .frame(height: 20)
                    
                Spacer()
            }
            Spacer()
        }
        .frame(height: 56)
    }
}

struct AvatarView: View {
    @StateObject private var imageFetcher = CatImageFetcher()
    @State private var imageUrl: String? = nil
    let contact: Contact
    
    var body: some View {
        ZStack {
            contact.haveStories ? setStories() : nil
            setImage()
            contact.onlineStatusMessage == "Online" ? setStatus().position(x: 48, y: 6) : nil
        }
        .task {
            await loadCatImage()
        }
        .frame(width: 56, height: 56)
    }
    
    private func setStories() -> some View {
        RoundedRectangle(cornerRadius: 18)
            .fill(LinearGradient(
                gradient: Gradient(colors: [Color("BlueGradientLeft"), Color("BlueGradientRight")]),
                startPoint: .leading,
                endPoint: .trailing))
            .frame(width: 56, height: 56)
    }
    
    @ViewBuilder
    private func setImage() -> some View {
        if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 48, height: 48)
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 48, height: 48)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color("BackgroundColor"), lineWidth: 2)
                        )
                case .failure:
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.white)
                        .frame(width: 48, height: 48)
                        .overlay {
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(Color.accentColor)
                        }
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            let nameInitials = String(contact.name.prefix(1))
            let surnameInitials = String(contact.surname?.prefix(1) ?? " ")
            let initials = "\(nameInitials)\(surnameInitials)"
            
            RoundedRectangle(cornerRadius: 16)
                .fill(Color("ActiveColor"))
                .stroke(Color("BackgroundColor"), lineWidth: 2)
                .frame(width: 56, height: 56)
                .overlay(
                    Text(initials)
                        .foregroundColor(.white)
                        .font(.bodyText1())
                )
        }
    }
    private func loadCatImage() async {
        let url = await withCheckedContinuation { continuation in
            imageFetcher.fetchCatImage { url in
                DispatchQueue.main.async {
                    continuation.resume(returning: url ?? "")
                }
            }
        }
        self.imageUrl = url
    }
    
    private func setStatus() -> some View {
        Circle()
            .stroke(Color.white, lineWidth: 4)
            .fill(Color.green)
            .frame(width: 12, height: 12)
    }
}

#Preview {
    ContactRowView(contact: Contact(name: "Anne", surname: "Das", avatar: "Arbuz", phoneNumber: "+456", onlineStatus: .now, haveStories: true, socialMediaLinks: [SocialMedia(name: .facebook, link: "fgg", image: "fff")]))
}

