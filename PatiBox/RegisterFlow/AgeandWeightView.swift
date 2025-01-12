//
//  AgeandWeightView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

struct AgeAndWeightView: View {
    @Binding var age: String
    @Binding var weight: String
    var onNext: () -> Void
  @Environment(\.colorScheme) var colorScheme

    var body: some View {
      VStack(spacing: 20) {
        Text("Yaş ve Kilo")
          .font(.title2)
        
        TextField("Yaş", text: $age)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .keyboardType(.numberPad)
        
        TextField("Kilo", text: $weight)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .keyboardType(.numberPad)
        
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
            
          }        }
      }
    }
}
