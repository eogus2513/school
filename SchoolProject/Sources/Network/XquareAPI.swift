import Foundation

import Moya

enum XquareAPI {
    case login(id: String, password: String)
}

extension XquareAPI: TargetType {

    var baseURL: URL {
        URL(string: "https://api.xquare.app")!
    }
    
    var path: String {
        return "/users/login"
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Moya.Task {
        switch self {
        case .login(let id, let password):
            return .requestParameters(
                parameters: [
                    "account_id": id,
                    "password": password,
                    "device_token": "12312eawsdsad"
                ],
                encoding: JSONEncoding.default
            )
        }
    }

    var validationType: ValidationType { .successCodes }
    
    var headers: [String : String]? {
        nil
    }
    
}
