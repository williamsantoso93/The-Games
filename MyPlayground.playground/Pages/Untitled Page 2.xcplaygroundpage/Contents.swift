//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
let baseAPI = "https://api.rawg.io/api"
let apiKey = "e07d0723795c4dfc8130cbcaf6083be6"

let searchText = "hello"


func getListGames(nextPage: String? = nil) {
    var queryItems: [URLQueryItem]?
    var urlString = ""
    if let nextPage = nextPage {
        urlString = nextPage
    } else {
        urlString = baseAPI + "/games"
        if !searchText.isEmpty {
            queryItems?.append(URLQueryItem(name: "search", value: searchText))
        }
    }
    
    print(queryItems)
}


getListGames()
