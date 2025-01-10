import SwiftUI

// MARK: - ProductListView
struct ProductListView: View {
  @EnvironmentObject var viewModel: ProductListViewModel
  @EnvironmentObject var cartViewModel: CartViewModel
  
  let gridColumns = [
    GridItem(.flexible(), spacing: 16),
    GridItem(.flexible(), spacing: 16)
  ]
  
  var body: some View {
    NavigationView {
      VStack(spacing: 16) {
        Picker("Filtrele", selection: $viewModel.selectedCategory) {
          Text("Tüm Ürünler").tag(ProductCategory.all)
          Text("Kedi Ürünleri").tag(ProductCategory.cat)
          Text("Köpek Ürünleri").tag(ProductCategory.dog)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        .background(Color.indigo.opacity(0.1))
        .cornerRadius(12)
        .padding(.horizontal, 8)
        
        ScrollView {
          LazyVGrid(columns: gridColumns, spacing: 20) {
            ForEach(viewModel.filteredProducts) { product in
              NavigationLink(destination: ProductDetailView(product: product)) {
                VStack(alignment: .leading, spacing: 12) {
                  ZStack(alignment: .topTrailing) {
                    Image(systemName: "photo") // Placeholder for product image
                      .resizable()
                      .scaledToFit()
                      .frame(height: 150)
                      .clipShape(RoundedRectangle(cornerRadius: 15))
                      .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
                    
                    Button(action: {
                      withAnimation {
                        viewModel.toggleFavorite(product: product)
                      }
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
                    .font(.headline)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .foregroundColor(.indigo)
                  
                  Text(String(format: "%.2f TL", product.price))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                  
                  if let cartItem = cartViewModel.cartItems.first(where: { $0.product.id == product.id }) {
                    HStack(spacing: 10) {
                      Button(action: {
                        withAnimation {
                          cartViewModel.decreaseQuantity(for: product)
                        }
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
                        withAnimation {
                          cartViewModel.addToCart(product: product)
                        }
                      }) {
                        Image(systemName: "plus")
                          .frame(width: 30, height: 30)
                          .background(Color.gray.opacity(0.2))
                          .clipShape(Circle())
                      }
                    }
                  } else {
                    Button(action: {
                      withAnimation {
                        cartViewModel.addToCart(product: product)
                      }
                    }) {
                      Text("Sepete Ekle")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                          LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                  }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 4)
              }
            }
            .padding(.all, 8)
          }
        }
        .navigationTitle("Ürünler")
        .background(Color.indigo.opacity(0.05))
      }
    }
  }
}
