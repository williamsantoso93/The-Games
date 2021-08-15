//
//  DetailViewModel.swift
//  The Games
//
//  Created by William Santoso on 15/08/21.
//

import Foundation

class DetailViewModel: ObservableObject {
    @Published var game: DetailGame?
    @Published var gameID: String?
    @Published var isLoading = false
    
    func getGameDetail() {
        guard let gameID = gameID else { return }
        isLoading = true
        
        let urlString = Networking.shared.baseAPI + "/games/\(gameID)"
        Networking.shared.getData(from: urlString) { (result: Result<DetailGame, NetworkError>, response) in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let data) :
                    self.game = data
                case .failure(let error) :
                    print(error.localizedDescription)
                }
            }
        }
    }
}
