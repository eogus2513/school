import Foundation

import Combine
import CombineMoya
import Moya

final class Service {
    
    static let shared = Service()

    private let xquareProvider = MoyaProvider<XquareAPI>()
    private let provider = MoyaProvider<API>()

    func login(id: String, password: String) -> AnyPublisher<Void, MoyaError> {
        return xquareProvider.requestPublisher(.login(id: id, password: password))
            .map(TokenResponse.self)
            .map {
                KeychainTask.shared.registerAccessToken($0.access_token)
            }
            .eraseToAnyPublisher()
    }
    func fetchLinkAll() -> AnyPublisher<LinkListResponse, MoyaError> {
        return provider.requestPublisher(.fetchLinkList)
            .map(LinkListResponse.self)
            .eraseToAnyPublisher()
    }
}
