import SwiftUI

// MARK: - ContentView
struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        TabView {
            ProductListView()
                .tabItem {
                    Label("Ürünler", systemImage: "list.bullet")
                }

            FavoritesView()
                .tabItem {
                    Label("Favoriler", systemImage: "heart.fill")
                }

            CartView()
                .tabItem {
                    Label("Sepet", systemImage: "cart")
                }
          RegistrationFlowView()
              .tabItem {
                  Label("Abonelik", systemImage: "plus.arrow.trianglehead.clockwise")
              }

            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person")
                }
        }
        .accentColor(.indigo)
        .sheet(isPresented: $authViewModel.showSignInSheet) {
            SignInSheet()
        }
    }
}
