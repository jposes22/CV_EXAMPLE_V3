import Foundation

struct CharacterPageableResponse: BasePageableResponse {
    typealias ResultResponse = CharacterResponse
    
    var results: [CharacterResponse]
}
