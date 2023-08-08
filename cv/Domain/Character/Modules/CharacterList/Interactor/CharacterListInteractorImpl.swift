import Foundation

protocol CharacterListInteractor {
    var presenter: CharacterListPresenter? { get set }
    var characterRepository: CharacterRepository? { get set }
    
    func downloadCharacterList(page: Int) async
}

class CharacterListInteractorImpl: CharacterListInteractor {
    var presenter: CharacterListPresenter?
    var characterRepository: CharacterRepository?
    
    func downloadCharacterList(page: Int) async {
        guard let characterResult = await characterRepository?.getCharacters(page: page) else { return }
        presenter?.presentCharacters(result: characterResult)
    }
    
}
