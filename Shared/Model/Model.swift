//
//  Model.swift
//  The Games
//
//  Created by William Santoso on 14/08/21.
//

import Foundation

// MARK: - ListGames
struct DataResult: Codable {
    let next: String?
    let previous: String?
    let results: [GameData]?
    
    enum CodingKeys: String, CodingKey {
        case next, previous, results
    }
}


// MARK: - Result
struct GameData: Codable, Identifiable {
    let id: Int
    let name: String
    let released: String
    let backgroundImage: String?
    let rating: Double?
    let ratingTop: Int?
    let parentPlatforms: [Item]?
    let genres: [Item]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, released
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case parentPlatforms = "parent_platforms"
        case genres
    }
}

// MARK: - Platform
struct Item: Codable, Identifiable {
    let id: Int?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}

// MARK: - DetailGame
struct DetailGame: Codable {
    let id: Int
    let name: String
    let released: String
    let backgroundImage: String?
    let rating: Double?
    let ratingTop: Int?
    let parentPlatforms: [Item]?
    let developers: [Item]?
    let genres: [Item]?
    let publishers: [Item]?
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case released
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case parentPlatforms = "parent_platforms"
        case developers
        case genres
        case publishers
        case description = "description_raw"
    }
}
