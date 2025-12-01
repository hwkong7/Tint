import Foundation

struct Tint: Identifiable, Codable, Hashable {
    let id: UUID
    let productName: String
    let brand: String
    let colorFamily: String?
    let rating: Int
    let description: String?

    enum CodingKeys: String, CodingKey {
        case id
        case productName = "product_name"
        case brand
        case colorFamily = "color_family"
        case rating
        case description
    }
}
