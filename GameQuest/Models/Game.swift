import Foundation

enum Section {
    case main
}

struct Games: Codable {
    var results: [Game]
}

struct Game: Codable, Hashable {
    var id: Int
    var title: String
    var description: String?
    var thumbnail: String?
    var short_description: String?
    var genre: String?
    var platform: String?
    var publisher: String?
    var developer: String?
    var release_date: String?
    var screenshots: [Screenshot]?
    var minimum_system_requirements: MinimumSystemRequirements?
}

struct Screenshot: Codable, Hashable {
    var id: Int
    var image: String
}

struct MinimumSystemRequirements: Codable, Hashable {
    var os: String
    var processor: String
    var memory: String
    var graphics: String
    var storage: String
}
