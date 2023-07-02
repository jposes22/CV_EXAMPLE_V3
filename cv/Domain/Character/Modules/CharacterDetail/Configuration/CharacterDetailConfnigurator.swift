import Foundation
import SwiftUI

final class CharacterDetailConfigurator {
    
    class func createModule(characterId: Int) -> some View {
        var view = CharacterDetailView()
        let presenter = CharacterDetailPresenterImpl()
        
        let characterRepository = CharacterRepositoryImpl(baseRemote: BaseRemoteImpl())
        let interactor = CharacterDetailInteractorImpl()
        interactor.characterRepository = characterRepository
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        view.characterViewModel.setCharacterId(characterId: characterId)
        
        return view
    }
    
}
