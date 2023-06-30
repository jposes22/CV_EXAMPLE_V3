import SwiftUI

struct CharacterListCardView: View {
    
    // MARK: - Properties
    var character: CharacterListDM
    
    // MARK: - Constants
    let widthImage: CGFloat = 80
    let heightImage: CGFloat = 110
    
    var body: some View {
        HStack(spacing: PaddingUtils.normalPadding) {
            // TODO: Add abstraction of library to cache images from url
            AsyncImage(url: URL(string: character.image ?? "")) { content in
                switch content {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure:
                    Image("default_placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                @unknown default:
                    Image("default_placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
        }
        .frame(width: widthImage, height: heightImage)
        .cornerRadius(20)
    }
}

struct CharacterListCardView_Previews: PreviewProvider {
    static var previews: some View {
        // TODO: Create right mock of DM for detail and Unit CardItem
        let character = CharacterListDM(id: 1, name: "test", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
        CharacterListCardView(character: character)
    }
}
