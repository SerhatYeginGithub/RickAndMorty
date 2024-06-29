import Foundation

// MARK: - RMCharacterElement
struct RMCharacterElement: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let url: String?
}

typealias RMCharacter = [RMCharacterElement]
