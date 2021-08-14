//
//  CardView.swift
//  The Games
//
//  Created by William Santoso on 12/08/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardView: View {
    let tags = ["Action", "RPG", "horror", "FPS"]
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
//        ZStack(alignment: .bottom) {
        VStack {
            Image("img")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0)
                .frame(height: 250)
            
            VStack {
                
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Title")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("2021/08/09")
                                .font(.body)
                                .fontWeight(.medium)
                        }
                        
                        Spacer()
                        
                        Text("#1")
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    
                    Text(tags.joined(separator: ", "))
                }
                .padding()
            }
            .foregroundColor(.white)
            .background(
                LinearGradient(gradient: Gradient(colors: [.clear, .clear, .black.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            )
        }
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CardView()
            CardView()
        }
        .padding()
    }
}

