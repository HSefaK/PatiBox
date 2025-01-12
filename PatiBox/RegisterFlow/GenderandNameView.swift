//
//  GenderandNameView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

struct GenderAndNameView: View {
    @Binding var gender: String
    @Binding var name: String
    var onNext: () -> Void
  @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: 20) {
            Text("Cinsiyet ve İsim")
                .font(.title2)

            Picker("Cinsiyet", selection: $gender) {
                Text("Erkek").tag("Erkek")
                Text("Dişi").tag("Dişi")
            }
            .pickerStyle(SegmentedPickerStyle())

            TextField("İsim", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())

          Button(action: {
            onNext()
          }) {
          if colorScheme == .dark {
            Text("İleri")
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
            Text("İleri")
              .padding(.vertical,16)
              .frame(maxWidth: .infinity)
              .background(
                LinearGradient(gradient: Gradient(colors: [AppColors.textPrimaryPurple, AppColors.textSecondaryOrange]), startPoint: .leading, endPoint: .trailing)
              )
              .foregroundColor(AppColors.textBackgroundWhite)
              .cornerRadius(10)
              .padding(.horizontal,8)
          }
          }        }
    }
}
