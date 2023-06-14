import SwiftUI
import SemicolonDesign

struct MainSearchBar: View {
    let text: Binding<String>
    let action: () -> Void
    
    var body: some View {
        ZStack(alignment: .trailing) {
            SDTextField(placeholder: "검색어를 입력해주세요!", text: text)
            Button(action: action) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.Primary.purple400)
                    .frame(width: 17, height: 17)
            }
            .padding(.trailing, 16)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        MainSearchBar(text: .constant("")) { }
    }
}
