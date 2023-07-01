import Foundation
import SwiftUI

final class CharacterListConfigurator {
    
    class func createModule() -> some View {
        var view = CharacterListView()
        
        let presenter = CharacterListPresenterImpl()
        
        let characterRepository = CharacterRepositoryImpl(baseRemote: BaseRemoteImpl())
        let interactor = CharacterListInteractorImpl()
        interactor.characterRepository = characterRepository
        
        interactor.presenter = presenter
        view.interactor = interactor
        presenter.view = view
        
        return view
    }

}
