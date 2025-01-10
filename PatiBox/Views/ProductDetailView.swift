// ProductDetailView content here...
import SwiftUI

// MARK: - ProductDetailView
struct ProductDetailView: View {
    let product: Product
    @EnvironmentObject var cartViewModel: CartViewModel
    @EnvironmentObject var viewModel: ProductListViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "photo") // Placeholder for product image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .padding()
                            .shadow(color: Color.gray.opacity(0.4), radius: 10, x: 0, y: 4)

                        Button(action: {
                            viewModel.toggleFavorite(product: product)
                        }) {
                            Image(systemName: viewModel.isFavorite(product: product) ? "heart.fill" : "heart")
                                .foregroundColor(viewModel.isFavorite(product: product) ? .red : .gray)
                                .padding(8)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 2)
                        }
                        .padding(8)
                    }

                    Text(product.name)
                        .font(.largeTitle)
                        .bold()
                        .lineLimit(1)
                        .foregroundColor(.indigo)

                    Text(String(format: "%.2f TL", product.price))
                        .font(.title)
                        .foregroundColor(.green)

                    Text("Kategori: \(product.category)")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }

                Text("Bu ürün hakkında detaylı bir açıklama yazısı. Ürünün kullanım şekilleri, içerikleri ve diğer önemli bilgiler burada yer alabilir. Bu açıklama oldukça uzun olabilir ve tüm detayları içermesi gerekir.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)

                Spacer()

                HStack {
                    if let cartItem = cartViewModel.cartItems.first(where: { $0.product.id == product.id }) {
                        HStack(spacing: 10) {
                            Button(action: {
                                cartViewModel.decreaseQuantity(for: product)
                            }) {
                                Image(systemName: "minus")
                                    .frame(width: 30, height: 30)
                                    .background(Color.gray.opacity(0.2))
                                    .clipShape(Circle())
                            }

                            Text("\(cartItem.quantity)")
                                .font(.headline)
                                .frame(width: 40)

                            Button(action: {
                                cartViewModel.addToCart(product: product)
                            }) {
                                Image(systemName: "plus")
                                    .frame(width: 30, height: 30)
                                    .background(Color.gray.opacity(0.2))
                                    .clipShape(Circle())
                            }
                        }
                    } else {
                        Button(action: {
                            cartViewModel.addToCart(product: product)
                        }) {
                            Text("Sepete Ekle")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing)
                                )
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
            .padding(.horizontal, 8)
        }
        .navigationTitle(product.name)
        .background(Color.indigo.opacity(0.05))
    }
}
