//
//  TagView.swift
//  The Games
//
//  Created by William Santoso on 12/08/21.
//

import SwiftUI

struct TagView: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .fixedSize(horizontal: true, vertical: false)
            .foregroundColor(.white)
            .padding(8)
            .padding(.horizontal, 8)
            .background(
                Capsule()
                    .foregroundColor(.gray)
            )
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(text: "Action")
    }
}
