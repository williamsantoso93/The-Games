//
//  DetailScreen.swift
//  The Games
//
//  Created by William Santoso on 15/08/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailScreen: View {
    var game = Bundle.main.decode(DetailGame.self, from: "DetailGame.json")
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                WebImage(url: URL(string: game.backgroundImage ?? ""))
                    .resizable()
                    .placeholder{
                        Image(systemName: "photo")
                            .font(.title)
                    }
                    .indicator(.activity)
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0)
                    .frame(height: 225)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(game.name)
                                .bold()
                                .font(.title)
                            
                            Text(game.released)
                                .font(.body)
                        }
                        
                        Spacer(minLength: 0)
                        
                        VStack(spacing: 10.0) {
                            Image(systemName: "star.fill")
                                .imageScale(.large)
                            
                            Text("\(String(format: "%.2f", game.rating ?? 0))")
                                .fontWeight(.medium)
                                .font(.subheadline)
                        }
                    }
                    
                    Text(game.description)
                    
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
                        if let genres = game.genres {
                            if !genres.isEmpty {
                                SectionsDetailView(header: "genres", items: genres)
                            }
                        }
                        if let platfroms = game.parentPlatforms {
                            if !platfroms.isEmpty {
                                PlatfromsDetailView(header: "platfroms", items: platfroms)
                            }
                        }
                        if let developers = game.developers {
                            if !developers.isEmpty {
                                SectionsDetailView(header: "developers", items: developers)
                            }
                        }
                        if let publishers = game.publishers {
                            if !publishers.isEmpty {
                                SectionsDetailView(header: "publishers", items: publishers)
                            }
                        }
                    }
                }
                .padding(16)
            }
            .padding(.bottom, 16)
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
            .previewLayout(.fixed(width: 414, height: 1500))
    }
}

struct SectionsDetailView: View {
    var header: String
    var items: [Item]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(header.capitalized)
                .font(.title3)
            Text(joinedItems(items))
                .font(.caption)
                .fixedSize(horizontal: true, vertical: true)
        }
    }
}

struct PlatfromsDetailView: View {
    var header: String
    var items: [ParentPlatform]
    var joinedItems: String {
        if !items.isEmpty {
            if items.count == 1 {
                return items.first?.platform.name ?? ""
            } else {
                var platfromName = [String]()
                
                for item in items {
                    platfromName.append(item.platform.name ?? "")
                }
                
                return platfromName.joined(separator: ", ")
            }
        }
        
        return ""
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(header.capitalized)
                .font(.title3)
            Text(joinedItems)
                .font(.caption)
                .fixedSize(horizontal: true, vertical: true)
        }
    }
}
