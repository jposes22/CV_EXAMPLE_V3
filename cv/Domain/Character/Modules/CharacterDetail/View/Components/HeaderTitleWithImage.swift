import SwiftUI

struct HeaderTitleWithImage: View {

    // MARK: - Properties
    @State var characterDetail: CharacterDetailDM
    
    var body: some View {
        VStack(spacing: PaddingUtils.normalPadding) {
            // TODO: Add abstraction of library to cache images from url
            ZStack(alignment: .bottom) {
                AsyncImage(url: URL(string: characterDetail.image)) { content in
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
                Text(characterDetail.name)
                    .frame(maxWidth: .infinity)
                    .padding(PaddingUtils.smallPadding)
                    .background(Color.black.opacity(0.6))
                    .foregroundColor(Color.white)
                    .font(.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Spacer()
            }

        }
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: 180)
        .frame(height: 180)
    }
}

struct HeaderTitleWithImage_Previews: PreviewProvider {
    static var previews: some View {
        let characterDetail = CharacterDetailDM(id: 1, name: "Rick", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
        HeaderTitleWithImage(characterDetail: characterDetail)
    }
}
