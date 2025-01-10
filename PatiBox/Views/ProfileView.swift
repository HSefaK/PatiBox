//
//  ProfileView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

// MARK: - ProfileView
struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        VStack {
            if authViewModel.isUserLoggedIn {
                Text("Merhaba, \(authViewModel.userName)")
                    .font(.title)
                    .padding()
            } else {
                Text("Profilinize erişmek için giriş yapın.")
                    .font(.title2)
                    .padding()

                Button(action: {
                    authViewModel.showSignInSheet = true
                }) {
                    Text("Giriş Yap")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.indigo)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
            }
        }
    }
}
