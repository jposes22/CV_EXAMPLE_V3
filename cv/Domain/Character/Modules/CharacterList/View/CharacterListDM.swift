import Foundation

struct CharacterListDM {
    let id: Int
    let name: String?
    let image: String?
    
    static func mapToDM(result: CharacterPageableResponse) -> [CharacterListDM] {
        return result.results.map { characterResponse in
            return CharacterListDM(
                id: characterResponse.id,
                name: characterResponse.name,
                image: characterResponse.image
            )
        }
    }
}
