import Foundation

protocol CharacterDetailInteractor {
    var presenter: CharacterDetailPresenter? { get set }
    var characterRepository: CharacterRepository? { get set }
    
    func downloadCharacterById(characterId: Int)
}

class CharacterDetailInteractorImpl: CharacterDetailInteractor {
    var presenter: CharacterDetailPresenter?
    var characterRepository: CharacterRepository?
    
    func downloadCharacterById(characterId: Int) {
        Task {
            guard let result = await characterRepository?.getCharacterById(id: characterId) else { return }
            presenter?.presentCharacter(result: result)
        }
    }
    
}
