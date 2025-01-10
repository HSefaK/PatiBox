import SwiftUI

// MARK: - FavoritesViewModel
class FavoritesViewModel: ObservableObject {
    @Published var favoriteProducts: [Product] = []

    init() {
        favoriteProducts = Product.sampleData.filter { ProductListViewModel().favorites.contains($0.id) }
    }
}
