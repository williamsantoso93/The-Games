//
//  ContentView.swift
//  Shared
//
//  Created by William Santoso on 11/08/21.
//

import SwiftUI
import SwiftUIX

struct ContentView: View {
    let listGames = Bundle.main.decode(DataResult.self, from: "listGames.json")
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if !viewModel.gamesData.isEmpty {
                    VStack(spacing: 0.0) {
                        ScrollView {
                            LazyVStack {
                                ForEach(viewModel.gamesData) { game in
                                    CardView(game: game)
                                        .onAppear {
                                            viewModel.loadMoreData(currentGamesData: game)
                                        }
                                }
                            }
                            .padding()
                        }
                    }
                } else {
                    VStack(spacing: 16.0) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                        
                        Text("Loading...")
                    }
                }
            }
            .navigationTitle("The Games")
            .navigationSearchBar {
                SearchBar("Search Games", text: $viewModel.searchText, onCommit:  {
                    viewModel.searchList()
                })
                .onCancel {
                    viewModel.clearSearch()
                }
                .searchBarStyle(.default)
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                                        viewModel.loadNewList()
                                    }) {
                                        Text("Profile")
                                    }
            )
        }
    }
    
    func name() {
        print("hello world")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
