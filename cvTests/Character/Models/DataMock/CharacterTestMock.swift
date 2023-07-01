import Foundation
@testable import cv

struct CharacterTestMock {
    private init() { /*Not Implement*/ }
    
    // TODO: change to read json from files all tests
    static let character = CharacterResponse(
        id: 1,
        name: "Rick Sanchez",
        status: .alive,
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
    )
    
    static func getCharacterPageableResponse() -> Result<CharacterPageableResponse, ApiError> {
        let response = CharacterPageableResponse(results: [character])
        return Result.success(response)
    }
    
    static func getCharacterByIdResponse() -> Result<CharacterResponse, ApiError> {
        return Result.success(character)
    }
}
