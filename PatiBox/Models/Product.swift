import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let category: ProductCategory

    static let sampleData: [Product] = [
        Product(name: "Kedi Maması", price: 100, category: .cat),
        Product(name: "Köpek Oyuncağı", price: 50, category: .dog),
        Product(name: "Kedi Oyuncağı", price: 40, category: .cat),
        Product(name: "Köpek Maması", price: 120, category: .dog)
    ]
}
