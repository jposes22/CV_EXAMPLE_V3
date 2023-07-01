import Foundation

struct CharacterResponse: BaseResponse {
    let id: Int
    let name: String?
    let status: CharacterStatusResponse?
    let image: String?
}

enum CharacterStatusResponse: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
}
