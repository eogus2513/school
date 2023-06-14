import Foundation
import Moya

enum API {
    case fetchLinkList
}

extension API: TargetType {

    var baseURL: URL { URL(string: "http://localhost:8080")! }

    var path: String {
        return "/link/all"
    }

    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        return .requestPlain
    }

    var validationType: ValidationType { .successCodes }
    
    var headers: [String: String]? {
        let token = KeychainTask.shared.fetchAccessToken() ?? ""
        return ["Authorization": "Bearer \(token)"]
    }

}
