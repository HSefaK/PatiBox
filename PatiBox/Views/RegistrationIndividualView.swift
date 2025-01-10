//
//  RegistrationIndividualView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 9.01.2025.
//

import Foundation
import SwiftUI

import SwiftUI

struct RegistrationIndividualView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var phone: String = ""
    @State private var address: String = ""
    @State private var isLoading: Bool = false
    @State private var errorMessage: String? = nil
    @FocusState private var focusedField: Field?

    enum Field: Hashable {
        case email, password, phone, address
    }

    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 16) {
                        Text("Üye Ol")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.accentColor)

                        Group {
                            TextField("E-posta", text: $email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .focused($focusedField, equals: .email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                            SecureField("Şifre", text: $password)
                                .focused($focusedField, equals: .password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                            HStack {
                                Image(systemName: "flag.fill")
                                    .foregroundColor(.red)
                                Text("+90")
                                TextField("Telefon", text: $phone)
                                    .keyboardType(.numberPad)
                                    .onChange(of: phone) { newValue in
                                        phone = formatPhoneNumber(newValue)
                                    }
                                    .focused($focusedField, equals: .phone)
                            }
                            .padding(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )

                            TextEditor(text: $address)
                                .frame(minHeight: 44, maxHeight: .infinity)
                                .focused($focusedField, equals: .address)
                                .onChange(of: address) { _ in
                                    withAnimation {
                                        proxy.scrollTo("address", anchor: .center)
                                    }
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                        }

                        if let errorMessage = errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                        }

                        if isLoading {
                            ProgressView()
                        } else {
                            Button("Kaydı Tamamla") {
                                submitRegistration()
                            }
                            .buttonStyle(.borderedProminent)
                            .padding()
                        }

                        Spacer()
                            .id("address")
                    }
                    .padding()
                }
                .background(Color(uiColor: .secondarySystemBackground))
                .navigationTitle("Üye Ol")
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button(action: moveToPreviousField) {
                            Image(systemName: "chevron.up")
                        }
                        Button(action: moveToNextField) {
                            Image(systemName: "chevron.down")
                        }
                        Button("Kapat") {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                    }
                }
            }
        }
    }

    private func moveToNextField() {
        switch focusedField {
        case .email:
            focusedField = .password
        case .password:
            focusedField = .phone
        case .phone:
            focusedField = .address
        default:
            focusedField = nil
        }
    }

    private func moveToPreviousField() {
        switch focusedField {
        case .address:
            focusedField = .phone
        case .phone:
            focusedField = .password
        case .password:
            focusedField = .email
        default:
            focusedField = nil
        }
    }

    private func formatPhoneNumber(_ input: String) -> String {
        let digits = input.filter { $0.isNumber }
        let chunks = [3, 3, 2, 2]
        var formatted = ""
        var currentIndex = digits.startIndex

        for chunk in chunks {
            guard currentIndex < digits.endIndex else { break }
            let endIndex = digits.index(currentIndex, offsetBy: chunk, limitedBy: digits.endIndex) ?? digits.endIndex
            formatted += digits[currentIndex..<endIndex]
            if endIndex < digits.endIndex {
                formatted += " "
            }
            currentIndex = endIndex
        }
        return formatted
    }

    private func submitRegistration() {
        guard !email.isEmpty, !password.isEmpty, !phone.isEmpty, !address.isEmpty else {
            errorMessage = "Lütfen tüm alanları doldurun."
            return
        }

        isLoading = true
        errorMessage = nil

        let url = URL(string: "https://9e5ecac0-0e08-4d41-8a01-681f4ca7351b-00-1gb4u5p2wt4wh.sisko.replit.dev/api/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: String] = [
            "name": "Yeni Kullanıcı",
            "email": email,
            "password": password
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false
                if let error = error {
                    errorMessage = "Bir hata oluştu: \(error.localizedDescription)"
                } else if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                    errorMessage = "Hata kodu: \(response.statusCode)"
                } else {
                    print("Kayıt başarılı!")
                }
            }
        }.resume()
    }
}
