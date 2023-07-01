import Foundation

protocol CharacterRepository {
    func getCharacterById(id: Int) async -> Result<CharacterResponse, ApiError>
    func getCharacters() async -> Result<CharacterPageableResponse, ApiError>
}
