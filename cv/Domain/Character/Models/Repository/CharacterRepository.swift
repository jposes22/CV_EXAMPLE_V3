import Foundation

protocol CharacterRepository {
    func getCharacters() async -> Result<CharacterPageableResponse, ApiError>
}
