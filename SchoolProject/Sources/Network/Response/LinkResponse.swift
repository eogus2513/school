import Foundation

struct LinkResponse: Decodable {
    let id: Int
    let title: String
    let link: String
    let createdAt: String
}
