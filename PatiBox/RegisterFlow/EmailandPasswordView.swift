//
//  EmailandPasswordView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

struct EmailAndPasswordView: View {
    @Binding var email: String
    @Binding var password: String
    var onComplete: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Mail ve Şifre")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.indigo)

            TextField("E-posta", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color.primary)
                .cornerRadius(10)
                .shadow(color: Color.secondary.opacity(0.4), radius: 10, x: 0, y: 4)

            SecureField("Şifre", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color.primary)
                .cornerRadius(10)
                .shadow(color: Color.secondary.opacity(0.4), radius: 10, x: 0, y: 4)

            Button(action: {
                if email.isEmpty || password.isEmpty {
                    print("E-posta ve şifre gerekli")
                } else {
                    onComplete()
                }
            }) {
                Text("Tamamla")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing)
                    )
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: Color.secondary.opacity(0.4), radius: 10, x: 0, y: 4)
            }
        }
        .padding()
        .background(Color.indigo.opacity(0.05))
        .cornerRadius(20)
        .shadow(color: Color.secondary.opacity(0.4), radius: 10, x: 0, y: 4)
        .padding()
    }
}
