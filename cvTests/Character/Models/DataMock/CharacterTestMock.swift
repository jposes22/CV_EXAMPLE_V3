import Foundation
@testable import cv

struct CharacterTestMock {
    private init() { /*Not Implement*/ }
    
    private static let characterResponseJson = "CharacterResponse"
    private static let characterPageableResponseJson = "CharacterPageabelResponse"
    
    static func getCharacter() -> CharacterResponse? {
        return TestUtils.parseLocalJsonToObject(with: characterResponseJson)
    }
    
    static func getCharacterPageableResponse() -> Result<CharacterPageableResponse, ApiError> {
        guard let response: CharacterPageableResponse = TestUtils.parseLocalJsonToObject(with: characterPageableResponseJson) else {
            return Result.failure(.appInternalError)
        }
        return Result.success(response)
    }
    
    static func getCharacterByIdResponse() -> Result<CharacterResponse, ApiError> {
        guard let response: CharacterResponse = TestUtils.parseLocalJsonToObject(with: characterResponseJson) else {
            return Result.failure(.appInternalError)
        }
        return Result.success(response)
    }
}
