import Foundation

import Combine

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""
    @Published var isSuccess: Bool = false
    let service = Service.shared

    func login() {
        service.login(id: id, password: password)
            .catch { error -> Empty<Void, Never> in
                print(error)
                self.isSuccess = false
                return .init()
            }
            .sink { _ in
                self.isSuccess = true
            }
            .cancel()
    }
}
