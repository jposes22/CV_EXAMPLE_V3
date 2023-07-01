import Foundation

protocol CharacterListPresenter {
    var view: CharacterListViewDisplayLogic? { get set }
    func presentCharacters(result: Result<CharacterPageableResponse, ApiError>)
}

class CharacterListPresenterImpl: CharacterListPresenter {
    var view: CharacterListViewDisplayLogic?
    
    func presentCharacters(result: Result<CharacterPageableResponse, ApiError>) {
        switch result {
        case .success(let charactersPageable):
            view?.displayCharacterList(displayModel: CharacterListDM.mapToDM(result: charactersPageable))
        case .failure:
            break
        }
    }
    
}
