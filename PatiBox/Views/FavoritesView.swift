import SwiftUI

// MARK: - FavoritesView
struct FavoritesView: View {
    @EnvironmentObject var viewModel: ProductListViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                if viewModel.favoriteProducts.isEmpty {
                    Text("Henüz favori ürününüz yok.")
                        .font(.title2)
                        .foregroundColor(.gray)
                } else {
                    List(viewModel.favoriteProducts) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            HStack {
                                Image(systemName: "photo") // Placeholder for product image
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())

                                VStack(alignment: .leading) {
                                    Text(product.name)
                                    Text(String(format: "%.2f TL", product.price))
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favoriler")
        }
    }
}
