import Foundation

struct CharacterDetailDM {
    let id: Int
    let name: String
    let image: String
    
    static func mapToDM(result: CharacterResponse) -> CharacterDetailDM {
        return CharacterDetailDM(
            id: result.id,
            name: result.name ?? "",
            image: result.image ?? ""
        )
    }
}
