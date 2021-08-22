//
//  FavoriteViewModel.swift
//  The Games (iOS)
//
//  Created by William Santoso on 21/08/21.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    @Published var dataResult: DataResult?
    @Published var searchText = ""
    @Published var isLoading = false
    
    @Published var favorites: [Favorite] = []
    @Published var gamesData: [GameData] = []
}
