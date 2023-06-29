//
//  CharacterListView.swift
//  cv
//
//  Created by DESGA on 28/6/23.
//

import SwiftUI

// MARK: - Display
protocol CharacterListViewDisplayLogic {
    func displayCharacterList(displayModel: [CharacterListDM])
}

extension CharacterListView: CharacterListViewDisplayLogic {
    func displayCharacterList(displayModel: [CharacterListDM]) {
        characterViewModel.characterList = displayModel
    }
    
    func fetchCharacters() {
        interactor?.downloadCharacterList()
    }
    
}

struct CharacterListView: View {
    // MARK: - Interactor
    var interactor: CharacterListInteractor?
    // MARK: - Properties
    @ObservedObject var characterViewModel = CharacterListViewModel()

    var body: some View {
        Section {
            LazyVStack {
                ForEach(characterViewModel.characterList, id: \.id) { character in
                    Text(" my -> \(character.name ?? "")")
                }
            }
        }.onAppear {
            fetchCharacters()
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
