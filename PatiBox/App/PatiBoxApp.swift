import SwiftUI

@main
struct PatiBoxApp: App {
    @StateObject private var productListViewModel = ProductListViewModel()
    @StateObject private var cartViewModel = CartViewModel()
    @StateObject private var authViewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(productListViewModel)
                .environmentObject(cartViewModel)
                .environmentObject(authViewModel)
        }
    }
}
