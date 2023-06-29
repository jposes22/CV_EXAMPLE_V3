import Foundation
import SwiftUI

final class CharacterListConfigurator {
    
    class func createModule() -> some View {
        var view = CharacterListView()
        let interactor = CharacterListInteractorImpl()
        let presenter = CharacterListPresenterImpl()
        // view.interactor = interactor
        // interactor.presenter = presenter
        // presenter.view = view

        return view
    }
}
