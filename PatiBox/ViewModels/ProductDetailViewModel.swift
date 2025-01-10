//
//  ProductDetailViewModel.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

class ProductDetailViewModel: ObservableObject {
    let product: Product
    private var cartViewModel: CartViewModel

    init(product: Product, cartViewModel: CartViewModel = CartViewModel()) {
        self.product = product
        self.cartViewModel = cartViewModel
    }

    func addToCart() {
        cartViewModel.addToCart(product: product)
    }
}
