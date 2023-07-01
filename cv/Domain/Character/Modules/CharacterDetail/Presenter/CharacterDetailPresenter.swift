import Foundation

protocol CharacterDetailPresenter: AnyObject {
    var view: CharacterDetailViewDisplayLogic? { get set }
    func presentCharacter(result: Result<CharacterResponse, ApiError>)
}

class CharacterDetailPresenterImpl: CharacterDetailPresenter {
    var view: CharacterDetailViewDisplayLogic?
    
    func presentCharacter(result: Result<CharacterResponse, ApiError>) {
        switch result {
        case .success(let success):
            view?.displayCharacterDetail(displayModel: CharacterDetailDM.mapToDM(result: success))
        case .failure:
            break
        }
    }
    
}
