import SwiftUI

import SemicolonDesign
import XWebKit

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                MainSearchBar(text: $viewModel.searchText, action: { })
                    .padding(.bottom, 8)
                ScrollView {
                    ForEach(viewModel.linkList, id: \.id) {
                        MainCell(title: $0.title)
                            .onTapGesture {
                                UIApplication.shared.keyWindow?.endEditing(true)
                                viewModel.isPresented = true
                            }
                    }
                }
            }
            .onTapGesture {
                UIApplication.shared.hideKeyboard()
            }
            .padding(16)
            .background(Color.GrayScale.gray50)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Text("홈")
                        .sdText(type: .heading6, textColor: .GrayScale.gray900)
                        .padding(.leading, 5)
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Image(systemName: "person.fill")
                        .frame(width: 27, height: 27)
                        .padding(3)
                        .background(Color.GrayScale.gray100)
                        .cornerRadius(15)
                }
            }
            .sheet(isPresented: $viewModel.isPresented) {
                XWebKitView(urlString: "https://www.naver.com")
            }
            .onAppear(perform: viewModel.fetchLinkList)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
