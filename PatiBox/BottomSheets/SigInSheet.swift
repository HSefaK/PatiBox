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
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    ScrollView {
      NavigationView {
        VStack(spacing: 20) {

                          Spacer()
          VStack(spacing: 16) {
                            Button(action: {
                                // Google Login Action
                            }) {
                                HStack {
                                    Image(systemName: "globe") // Replace with Google icon
                                        .font(.title2)
                                    Text("Continue with Google")
                                        .font(.body)
                                        .foregroundColor(Color(uiColor: .label))
                                }
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color(uiColor: .systemBackground))
                                .cornerRadius(10)
                                .shadow(color: Color.secondary.opacity(0.4), radius: 10, x: 0, y: 4)
                            }

                            Button(action: {
                                // Facebook Login Action
                            }) {
                                HStack {
                                    Image(systemName: "f.square") // Replace with Facebook icon
                                        .font(.title2)
                                    Text("Continue with Facebook")
                                        .font(.body)
                                        .foregroundColor(Color(uiColor: .label))
                                }
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color(uiColor: .systemBackground))
                                .cornerRadius(10)
                                .shadow(color: Color.secondary.opacity(0.4), radius: 10, x: 0, y: 4)
                            }
                        }
                        .padding(.horizontal)
          
          Text("Giriş Yap")
            .font(.largeTitle)
            .bold()
            .foregroundColor(Color(.label))
          
          TextField("E-posta", text: $authViewModel.email)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal,8)
          
          SecureField("Şifre", text: $authViewModel.password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal,8)
            .foregroundColor(Color(uiColor: .label))
          
          Button(action: {
            authViewModel.signIn()
          }) {
            if colorScheme == .dark {
              Text("Giriş Yap")
                .padding(.vertical,16)
                .frame(maxWidth: .infinity)
                .background(
                  LinearGradient(gradient: Gradient(colors: [AppColors.textPrimaryPurple, AppColors.textSecondaryOrange]), startPoint: .leading, endPoint: .trailing)
                    .opacity(0)
                )
                .border(LinearGradient(gradient: Gradient(colors: [AppColors.textPrimaryPurple, AppColors.textSecondaryOrange]), startPoint: .leading, endPoint: .trailing), width: 4 )
                .foregroundColor(AppColors.textBackgroundWhite)
                .cornerRadius(10)
                .padding(.horizontal,8)
            } else {
              Text("Giriş Yap")
                .padding(.vertical,16)
                .frame(maxWidth: .infinity)
                .background(
                  LinearGradient(gradient: Gradient(colors: [AppColors.textPrimaryPurple, AppColors.textSecondaryOrange]), startPoint: .leading, endPoint: .trailing)
                )
                .foregroundColor(AppColors.textBackgroundWhite)
                .cornerRadius(10)
                .padding(.horizontal,8)
              
            }
            
            
          }
          NavigationLink(destination: RegistrationIndividualView()) {
            if colorScheme == .dark {
              Text("Üye Ol")
                .padding(.vertical,16)
                .frame(maxWidth: .infinity)
                .background(
                  LinearGradient(gradient: Gradient(colors: [AppColors.textSecondaryOrange, AppColors.textPrimaryPurple]), startPoint: .leading, endPoint: .trailing)
                    .opacity(0)
                )
                .border(LinearGradient(gradient: Gradient(colors: [AppColors.textSecondaryOrange, AppColors.textPrimaryPurple]), startPoint: .leading, endPoint: .trailing), width: 4 )
                .foregroundColor(AppColors.textBackgroundWhite)
                .cornerRadius(10)
                .padding(.horizontal,8)
            } else {
              Text("Üye Ol")
                .padding(.vertical,16)
                .frame(maxWidth: .infinity)
                .background(
                  LinearGradient(gradient: Gradient(colors: [AppColors.textPrimaryPurple, AppColors.textSecondaryOrange]), startPoint: .leading, endPoint: .trailing)
                )
                .foregroundColor(AppColors.textBackgroundWhite)
                .cornerRadius(10)
                .padding(.horizontal,8)
              
            }
          }

            Spacer()
            NavigationLink(destination: ForgotPasswordView()) {
              if colorScheme == .dark {
                Text("Şifremi Unuttum")
                  .padding(.vertical,16)
                  .frame(maxWidth: .infinity)
                  .background(
                    LinearGradient(gradient: Gradient(colors: [AppColors.textSecondaryOrange, AppColors.textPrimaryPurple]), startPoint: .leading, endPoint: .trailing)
                      .opacity(0)
                  )
                  .border(LinearGradient(gradient: Gradient(colors: [AppColors.textSecondaryOrange, AppColors.textPrimaryPurple]), startPoint: .leading, endPoint: .trailing), width: 4 )
                  .foregroundColor(AppColors.textBackgroundWhite)
                  .cornerRadius(10)
                  .padding(.horizontal,8)
              } else {
                Text("Şifremi Unuttum")
                  .padding(.vertical,16)
                  .frame(maxWidth: .infinity)
                  .background(
                    LinearGradient(gradient: Gradient(colors: [AppColors.textPrimaryPurple, AppColors.textSecondaryOrange]), startPoint: .leading, endPoint: .trailing)
                  )
                  .foregroundColor(AppColors.textBackgroundWhite)
                  .cornerRadius(10)
                  .padding(.horizontal,8)
                
              }
            }

            Spacer()
          }
          .padding()
        }

    }
    
  }
  }

