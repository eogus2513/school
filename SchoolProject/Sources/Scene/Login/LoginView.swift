import SwiftUI
import SemicolonDesign

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        NavigationView {
            VStack {
                SDTextField(placeholder: "아이디", text: $viewModel.id)
                    .padding(.horizontal, 16)
                SDTextField(placeholder: "비밀번호", text: $viewModel.password, isSecure: true)
                    .padding(.horizontal, 16)
                FillButton(
                    text: "로그인",
                    action: viewModel.login,
                    type: .rounded
                )
                Spacer()
            }
            .navigationTitle("로그인")
            .fullScreenCover(isPresented: $viewModel.isSuccess) {
                MainView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
