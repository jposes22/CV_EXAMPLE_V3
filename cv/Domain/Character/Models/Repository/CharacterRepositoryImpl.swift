import Foundation

class CharacterRepositoryImpl: CharacterRepository {
    let baseRemote: BaseRemote
    
    init(baseRemote: BaseRemote) {
        self.baseRemote = baseRemote
    }
    
    func getCharacterById(id: Int) async -> Result<CharacterResponse, ApiError> {
        let characterRequest = CharacterByIdRequest(characterId: id)
        return await baseRemote.fetchRequest(request: characterRequest)
    }
    
    func getCharacters(page: Int) async -> Result<CharacterPageableResponse, ApiError> {
        let characterRequest = CharacterRequest(page: page)
        return await baseRemote.fetchRequest(request: characterRequest)
    }
}
