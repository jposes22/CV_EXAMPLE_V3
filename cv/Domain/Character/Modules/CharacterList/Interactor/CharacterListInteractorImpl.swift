import Foundation

protocol CharacterListInteractor {
    var presenter: CharacterListPresenter? { get set }
    var characterRepository: CharacterRepository? { get set }
    
    func downloadCharacterList() async
}

class CharacterListInteractorImpl: CharacterListInteractor {
    var presenter: CharacterListPresenter?
    var characterRepository: CharacterRepository?
    
    func downloadCharacterList() async {
        guard let characterResult = await characterRepository?.getCharacters() else { return }
        presenter?.presentCharacters(result: characterResult)
    }
    
}
