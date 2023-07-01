@testable import cv

class CharacterRepositoryMock: CharacterRepository {
    // MARK: - Properties
    var characterByIdResult: Result<CharacterResponse, ApiError>?
    var charactersResult: Result<CharacterPageableResponse, ApiError>?
    
    // MARK: - WillReturn
    func willReturnCharacterById(result: Result<CharacterResponse, ApiError>) {
        characterByIdResult = result
    }
    
    func willReturnCharacters(result: Result<CharacterPageableResponse, ApiError>) {
        charactersResult = result
    }
    
    // MARK: - Methods
    func getCharacterById(id: Int) async -> Result<CharacterResponse, ApiError> {
        if let characterByIdResult {
            return characterByIdResult
        }
        return .failure(ApiError.appInternalError)
    }
    
    func getCharacters() async -> Result<CharacterPageableResponse, ApiError> {
        if let charactersResult {
            return charactersResult
        }
        return .failure(ApiError.appInternalError)
    }
    
}
