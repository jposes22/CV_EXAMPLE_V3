import Foundation

protocol CharacterListInteractor {
    func downloadCharacterList()
}

class CharacterListInteractorImpl: CharacterListInteractor {
    let presenter: CharacterListPresenter
    let characterListRepository: CharacterRepository
    
    init(presenter: CharacterListPresenter, characterListRepository: CharacterRepository) {
        self.presenter = presenter
        self.characterListRepository = characterListRepository
    }
    
    func downloadCharacterList() {
        Task {
            let characterResult = await characterListRepository.getCharacters()
            presenter.presentCharacters(result: characterResult)
        }
    }
}
