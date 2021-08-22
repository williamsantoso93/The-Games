//
//  EditProfileScreen.swift
//  The Games (iOS)
//
//  Created by William Santoso on 21/08/21.
//

import SwiftUI

struct EditProfileScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State var name: String = ""
    @State var github: String = ""
    @State var linkedin: String = ""
    @State var instagram: String = ""
    let userDefault = UserDefaults.standard
    var body: some View {
        NavigationView {
            VStack(spacing: 16.0) {
                TitleTextField(title: "Name", text: $name, placeHolder: "William Santoso")
                TitleTextField(title: "Github", text: $github, placeHolder: "https://github.com/williamsantoso93")
                TitleTextField(title: "LinkedIn", text: $linkedin, placeHolder: "https://www.linkedin.com/in/williamsantoso93/")
                TitleTextField(title: "Instagram", text: $instagram, placeHolder: "https://www.instagram.com/william.santoso93/")
                Spacer()
            }
            .padding()
            .navigationTitle("Edit")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                                    Button {
                                        presentationMode.wrappedValue.dismiss()
                                    } label: {
                                        Text("Cancel")
                                    },
                                trailing:
                                    Button {
                                        userDefault.set(name, forKey: "name")
                                        userDefault.set(github, forKey: "github")
                                        userDefault.set(linkedin, forKey: "linkedin")
                                        userDefault.set(instagram, forKey: "instagram")
                                        presentationMode.wrappedValue.dismiss()
                                    } label: {
                                        Text("Save")
                                    }
            )
        }
    }
}

struct EditProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileScreen()
    }
}

struct TitleTextField: View {
    var title: String
    @Binding var text: String
    var placeHolder: String
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Text(title)
            TextField(placeHolder, text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
