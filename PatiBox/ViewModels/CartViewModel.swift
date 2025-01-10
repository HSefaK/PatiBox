import SwiftUI

// MARK: - CartViewModel
class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []

    var totalPrice: Double {
        cartItems.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }

    func addToCart(product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(product: product, quantity: 1))
        }
    }

    func removeFromCart(product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity -= 1
            if cartItems[index].quantity == 0 {
                cartItems.remove(at: index)
            }
        }
    }
  
  func decreaseQuantity(for product: Product) {
      if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
          cartItems[index].quantity -= 1
          if cartItems[index].quantity == 0 {
              cartItems.remove(at: index)
          }
      }
  }

    func checkout() {
        print(String(format: "Checkout completed. Total: %.2f TL", totalPrice))
        cartItems.removeAll()
    }
}
