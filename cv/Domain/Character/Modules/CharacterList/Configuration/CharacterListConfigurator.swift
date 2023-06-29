import Foundation
import SwiftUI

final class CharacterListConfigurator {
    
    class func createModule() -> some View {
        var view = CharacterListView()
        
        let presenter = CharacterListPresenterImpl()
        
        let characterRepository = CharacterRepositoryImpl(baseRemote: BaseRemoteImpl())
        let interactor = CharacterListInteractorImpl(presenter: presenter, characterListRepository: characterRepository)
        
        view.interactor = interactor
        presenter.view = view
        
        return view
    }

}
