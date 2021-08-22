//
//  FavoriteScreen.swift
//  The Games (iOS)
//
//  Created by William Santoso on 21/08/21.
//

import SwiftUI
import SwiftUIX

struct FavoriteScreen: View {
    @StateObject var viewModel = FavoriteViewModel()
    var body: some View {
        NavigationView {
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
                                                .onAppear {
//                                                    viewModel.loadMoreData(currentGamesData: viewModel.gamesData[index])
                                                }
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
                            Text("Game not found")
                        }
                    }
                }
            }
            .navigationTitle("Favorite")
            .navigationSearchBar {
                SearchBar("Search Games", text: $viewModel.searchText, onCommit: {
//                    viewModel.searchList()
                })
                .onCancel {
//                    viewModel.clearSearch()
                }
                .searchBarStyle(.default)
            }
        }
    }
}

struct FavoriteScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteScreen()
    }
}
