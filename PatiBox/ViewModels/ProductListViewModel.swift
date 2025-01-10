import SwiftUI

// MARK: - ProductListViewModel
class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = Product.sampleData
    @Published var favorites: Set<UUID> = []
    @Published var selectedCategory: ProductCategory = .all

    var filteredProducts: [Product] {
        switch selectedCategory {
        case .all:
            return products
        case .cat:
          return products.filter { $0.category.rawValue == ProductCategory.cat.rawValue }
        case .dog:
          return products.filter { $0.category.rawValue == ProductCategory.dog.rawValue }
        }
    }

    var favoriteProducts: [Product] {
        products.filter { favorites.contains($0.id) }
    }

    func toggleFavorite(product: Product) {
        if favorites.contains(product.id) {
            favorites.remove(product.id)
        } else {
            favorites.insert(product.id)
        }
    }

    func isFavorite(product: Product) -> Bool {
        favorites.contains(product.id)
    }
}
