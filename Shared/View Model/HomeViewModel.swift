//
//  HomeViewModel.swift
//  
//
//  Created by William Santoso on 14/08/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var dataResult: DataResult?
    @Published var gamesData: [GameData] = []
    
    @Published var searchText = ""
    
    init() {
        loadNewList()
    }
    
    func loadNewList() {
        gamesData.removeAll()
        getListGames { data in
            self.dataResult = data
            if let results = data.results {
                self.gamesData = results
            }
        }
    }
    
    
    func clearSearch() {
        searchText = ""
        loadNewList()
    }
    
    func searchList() {
        if !searchText.isEmpty {
            loadNewList()
        }
    }
    
    func getListGames(nextPage: String? = nil, completion: @escaping (DataResult) -> Void) {
        var queryItems: [URLQueryItem]? = []
        var urlString = ""
        if let nextPage = nextPage {
            urlString = nextPage
        } else {
            urlString = Networking.shared.baseAPI + "/games"
            if !searchText.isEmpty {
                queryItems?.append(.init(name: "search", value: searchText))
            }
        }
        
        guard !urlString.isEmpty else { return }
        
        Networking.shared.getData(from: urlString, queryItems: queryItems) { (result: Result<DataResult, NetworkError>, response) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data) :
                    completion(data)
                case .failure(let error) :
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func loadMoreData(currentGamesData: GameData) {
        guard let next = dataResult?.next else { return }
        
        guard !gamesData.isEmpty else { return }
        
        let secondLastData = gamesData[gamesData.count - 2]
        
        if currentGamesData.id == secondLastData.id {
            getListGames(nextPage: next) { data in
                self.dataResult = data
                if let results = data.results {
                    self.gamesData.append(contentsOf: results)
                }
            }
        }
    }
}
