//
//  ProfileScreen.swift
//  The Games
//
//  Created by William Santoso on 15/08/21.
//

import SwiftUI

struct ProfileScreen: View {
    @Environment(\.openURL) var openURL
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Image("profile")
                    .frame(height: 125)
                    .clipShape(Circle())
                Text("William Santoso")
                    .bold()
                    .font(.title)
                    .lineLimit(1)
                    .fixedSize(horizontal: true, vertical: false)
            }
            HStack(spacing: 40) {
                Button(action: {
                    goToURL("https://github.com/williamsantoso93")
                }) {
                    SocialMediaIcon(iconName: "github")
                }
                Button(action: {
                    goToURL("https://www.linkedin.com/in/williamsantoso93/")
                }) {
                    SocialMediaIcon(iconName: "linkedin")
                }
                Button(action: {
                    goToURL("https://www.instagram.com/william.santoso93/")
                }) {
                    SocialMediaIcon(iconName: "instagram")
                }
            }
        }
        .padding()
        .navigationTitle("Profile")
    }
    func goToURL(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        openURL(url)
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileScreen()
        }
    }
}

struct SocialMediaIcon: View {
    var iconName: String
    var body: some View {
        Image(iconName)
            .resizable()
            .scaledToFit()
            .padding(5)
            .background(Color.white)
            .cornerRadius(10)
            .frame(width: 75, height: 75)
            .shadow(color: .primary.opacity(0.25), x: 2, y: 3, blur: 5)
    }
}
