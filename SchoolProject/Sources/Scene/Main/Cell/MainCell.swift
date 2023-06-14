import SwiftUI
import XWebKit
import SemicolonDesign

struct MainCell: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .sdText(type: .body4)
                .padding(.leading, 16)
            Spacer()
        }
        .frame(height: 50)
        .background(Color.GrayScale.gray100)
        .cornerRadius(12)
    }
}

struct MainCell_Previews: PreviewProvider {
    static var previews: some View {
        MainCell(title: "반가워요")
    }
}
