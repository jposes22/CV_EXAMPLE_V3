import SwiftUI

protocol CharacterDetailViewDisplayLogic {
    func displayCharacterDetail(displayModel: CharacterDetailDM)
}

extension CharacterDetailView: CharacterDetailViewDisplayLogic {
    func displayCharacterDetail(displayModel: CharacterDetailDM) {
        DispatchQueue.main.async {
            characterViewModel.characterDetail = displayModel
        }
    }
    func fetchCharacterDetail() {
        guard let characterId = characterViewModel.characterId else { return }
        interactor?.downloadCharacterById(characterId: characterId)
    }
    
}

struct CharacterDetailView: View {
    // MARK: - Interactor
    var interactor: CharacterDetailInteractor?
    
    // MARK: - Properties
    @ObservedObject var characterViewModel = CharacterDetailViewModel()
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    if let character = characterViewModel.characterDetail {
                        HeaderTitleWithImage(characterDetail: character)
                    } else {
                        ProgressView()
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundGradientColor)
        .onAppear {
            fetchCharacterDetail()
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CharacterDetailView(characterViewModel: CharacterDetailViewModel.sample)
        }
    }
}
