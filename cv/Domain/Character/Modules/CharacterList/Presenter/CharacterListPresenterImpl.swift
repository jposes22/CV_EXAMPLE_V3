import Foundation

protocol CharacterListPresenter {
    func presentCharacters(result: Result<CharacterPageableResponse, ApiError>)
}

class CharacterListPresenterImpl: CharacterListPresenter {
    var view: CharacterListView?
    
    func presentCharacters(result: Result<CharacterPageableResponse, ApiError>) {
        switch result {
        case .success(let charactersPageable):
            view?.displayCharacterList(displayModel: CharacterListDM.mapToDM(result: charactersPageable))
        case .failure:
            break
        }
    }
    
}
