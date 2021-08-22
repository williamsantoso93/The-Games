//
//  FavoriteScreen.swift
//  The Games (iOS)
//
//  Created by William Santoso on 21/08/21.
//

import SwiftUI
import CoreData
import SwiftUIX

struct FavoriteScreen: View {
    @StateObject var viewModel = FavoriteViewModel()
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Favorite.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Favorite.timestamp, ascending: true)]) var results: FetchedResults<Favorite>
    var body: some View {
        Group {
            if !viewModel.gamesData.isEmpty {
                VStack(spacing: 0.0) {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(viewModel.gamesData.indices, id: \.self) { index in
                                NavigationLink(
                                    destination: DetailScreen(gameID: viewModel.gamesData[index].gameID),
                                    label: {
                                        CardView(game: viewModel.gamesData[index])
                                    })
                            }
                        }
                        .padding()
                    }
                }
            } else {
                VStack(spacing: 16.0) {
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                        Text("Loading...")
                    } else {
                        Text("No Favorite Games")
                    }
                }
            }
        }
        .navigationTitle("Favorite")
//        .navigationBarItems(trailing:
//                                Button(action: {
//                                    let favorite = Favorite(context: moc)
//                                    favorite.favoriteID = UUID()
//                                    favorite.timestamp = Date()
//                                    favorite.gameID = 1234
//                                    PersistenceController.shared.save()
//                                }) {
//                                    Text("add")
//                                }
//        )
        .onAppear {
            var temp: [GameData] = []
            for result in results {
                var genres: [Item]?
                if let genresData = result.genres?.data(using: .utf8) {
                    genres = try? JSONDecoder().decode([Item].self, from: genresData)
                }
                let gameData: GameData = .init(gameID: Int(result.gameID), name: result.name ?? "-", released: result.released ?? "-", backgroundImage: result.backgroundImage, rating: result.rating, ratingTop: nil, parentPlatforms: nil, genres: genres)
                temp.append(gameData)
            }
            viewModel.gamesData = temp
        }
    }
}

struct FavoriteScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteScreen()
    }
}
