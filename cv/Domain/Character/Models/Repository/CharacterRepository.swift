import Foundation

protocol CharacterRepository {
    func getCharacterById(id: Int) async -> Result<CharacterResponse, ApiError>
    func getCharacters(page: Int) async -> Result<CharacterPageableResponse, ApiError>
}
