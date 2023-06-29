import Foundation

class CharacterRepositoryImpl: CharacterRepository {
    let baseRemote: BaseRemote
    
    init(baseRemote: BaseRemote) {
        self.baseRemote = baseRemote
    }
    
    func getCharacters() async -> Result<CharacterPageableResponse, ApiError> {
        let characterRequest = CharacterRequest()
        return await baseRemote.fetchRequest(request: characterRequest)
    }
}
