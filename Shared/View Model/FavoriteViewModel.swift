//
//  FavoriteViewModel.swift
//  The Games (iOS)
//
//  Created by William Santoso on 21/08/21.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    @Published var dataResult: DataResult?
    @Published var gamesData: [GameData] = []
    @Published var searchText = ""
    @Published var isLoading = false
}
