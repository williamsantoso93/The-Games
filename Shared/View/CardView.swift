//
//  CardView.swift
//  The Games
//
//  Created by William Santoso on 12/08/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardView: View {
    var game: GameData
    var genres: String {
        if let genres = game.genres {
            if !genres.isEmpty {
                if genres.count == 1 {
                    return genres.first?.name ?? ""
                } else {
                    var genresName = [String]()
                    
                    for genre in genres {
                        genresName.append(genre.name ?? "")
                    }
                    
                    return genresName.joined(separator: ", ")
                }
            }
        }
        
        return ""
    }
    var body: some View {
        ZStack {
            WebImage(url: URL(string: game.backgroundImage ?? ""))
                .resizable()
                .placeholder{
                    Image(systemName: "photo")
                        .font(.title)
                }
                .indicator(.activity)
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0)
                .frame(height: 250)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(game.name)
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            Text(game.released)
                                .font(.body)
                                .fontWeight(.medium)
                        }
                        
                        Spacer()
                        
                        
                        HStack {
                            Image(systemName: "star.fill")
                            
                            Text("\(String(format: "%.2f", game.rating ?? 0))")
                                .fontWeight(.medium)
                        }
                        .font(.body)
                    }
                    
                    if !genres.isEmpty {
                        Text(genres)
                            .font(.caption)
                    }
                }
                .padding()
            }
            .foregroundColor(.white)
            .background(
                LinearGradient(gradient: Gradient(colors: [.clear, .clear, .black.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            )
        }
        .background(Color.gray)
        .frame(height: 250)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CardView(game: .init(id: 0, name: "portal", released: "2013-09-17", backgroundImage: "https://media.rawg.io/media/games/7fa/7fa0b586293c5861ee32490e953a4996.jpg", rating: 4.48, ratingTop: 5, parentPlatforms: [.init(id: 1, name: "PC")], genres: [.init(id: 1, name: "Action"),.init(id: 1, name: "Action2"),.init(id: 1, name: "Action1")]))
        }
        .padding()
    }
}
