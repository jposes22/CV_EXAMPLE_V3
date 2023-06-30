import SwiftUI

extension Color {

    static let backgroundGradientColor: LinearGradient = LinearGradient(
        gradient: Gradient(colors: [Color("backgroundColor"), Color("backgroundColor2")]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

}
