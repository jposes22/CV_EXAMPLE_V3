import Foundation

class CharacterByIdRequest: BaseRequest {
    typealias Response = CharacterResponse

    let characterId: Int
    
    init(characterId: Int) {
        self.characterId = characterId
    }
    
    var path: String { "/character/\(characterId)" }
    
    var method: Method = .GET
    
}
