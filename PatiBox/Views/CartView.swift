import SwiftUI

// MARK: - CartView
struct CartView: View {
    @EnvironmentObject var viewModel: CartViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                if viewModel.cartItems.isEmpty {
                    Text("Sepetiniz boş")
                        .font(.title)
                        .foregroundColor(.gray)
                } else {
                    List(viewModel.cartItems) { item in
                        HStack {
                            Image(systemName: "photo") // Placeholder for product image
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())

                            VStack(alignment: .leading) {
                                Text(item.product.name)
                                Text(String(format: "Adet: %d", item.quantity))
                                Text(String(format: "Fiyat: %.2f TL", item.product.price * Double(item.quantity)))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }

                    Text(String(format: "Toplam: %.2f TL", viewModel.totalPrice))
                        .font(.title2)
                        .bold()
                        .padding()

                    Button("Satın Al") {
                        viewModel.checkout()
                    }
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .navigationTitle("Sepet")
            .padding(.horizontal, 8)
        }
    }
}
