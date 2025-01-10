//
//  SigInSheet.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

// MARK: - SignInSheet
struct SignInSheet: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Giriş Yap")
                    .font(.largeTitle)
                    .bold()

                TextField("E-posta", text: $authViewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Şifre", text: $authViewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    authViewModel.signIn()
                }) {
                    Text("Giriş Yap")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                NavigationLink(destination: RegistrationIndividualView()) {
                    Text("Üye Ol")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .padding()
                }

                Spacer()
            }
            .padding()
        }
    }
}
