import Foundation

import Combine

class MainViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var isPresented: Bool = false
    @Published var linkList: [LinkResponse] = []
    let service = Service.shared

    func fetchLinkList() {
        self.service.fetchLinkAll()
            .catch { error -> Empty<LinkListResponse, Never> in
                print(error)
                return .init()
            }
            .sink {
                self.linkList = $0.links
            }
            .cancel()
    }
}
