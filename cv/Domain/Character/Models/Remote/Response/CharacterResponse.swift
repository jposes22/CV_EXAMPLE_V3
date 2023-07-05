import Foundation

struct CharacterResponse: BaseResponse {
    let id: Int
    let name: String?
    let species: String?
    let gender: CharacterGenderResponse?
    let status: CharacterStatusResponse?
    let image: String?
    let origin: CharacterPlaceResponse?
    let location: CharacterPlaceResponse?
}

struct CharacterPlaceResponse: BaseResponse {
    let name: String
    let url: String?
}

enum CharacterStatusResponse: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
}

enum CharacterGenderResponse: String, Codable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown
}
