//
//  AuthViewModel.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation

// MARK: - AuthViewModel
class AuthViewModel: ObservableObject {
    @Published var isUserLoggedIn: Bool = false
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showSignInSheet: Bool = false

    func signIn() {
        // Basit doğrulama simülasyonu
        if email == "test@example.com" && password == "password" {
            isUserLoggedIn = true
            userName = "Test Kullanıcı"
            showSignInSheet = false
        } else {
            // Hata mesajı
        }
    }
}
