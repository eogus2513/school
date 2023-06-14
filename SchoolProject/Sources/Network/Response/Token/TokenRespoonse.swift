import Foundation

struct TokenResponse: Decodable {
    let access_token: String
    let refresh_token: String
    let expire_at: String
    let role: String
}
