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
    
    func getCharacters() async -> Result<CharacterPageableResponse, ApiError> {
        let characterRequest = CharacterRequest()
        return await baseRemote.fetchRequest(request: characterRequest)
    }
}
