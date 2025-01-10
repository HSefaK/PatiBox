import SwiftUI

struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
}
