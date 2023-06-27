import Foundation

struct CharacterPageableResponse: BaseResponse {
    let results: [CharacterResponse]
}

struct CharacterResponse: BaseResponse {
    let id: Int?
    let name: String?
    let status: CharacterStatusResponse?
}

enum CharacterStatusResponse: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
}
