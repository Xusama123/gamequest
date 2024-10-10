//
//  Game.swift
//  GameQuest
//
//  Created by Usama Waked on 2024-10-10.
//

import Foundation


enum Section{
    case main
}

struct Games: Codable{
    var results: [Game]
}

struct Game: Codable, Hashable{
    var id: Int
    var title: String
    var description: String
    var thumbnail: String
    var genre: String
    var platform: String
    var publisher: String
    var developer: String
    var release_date: String
    
    enum CodingKeys: String, CodingKey{
        case id, title, description, thumbnail, genre, platform, publisher, developer, release_date
    }
}
