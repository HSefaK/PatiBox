//
//  FoodPreferenceView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

struct FoodPreferenceView: View {
    @Binding var foodPreference: String
    var onNext: () -> Void
  @Environment(\.colorScheme) var colorScheme

    var body: some View {
      VStack(spacing: 20) {
        Text("Yemek Tercihi")
          .font(.title2)
        
        Picker("Yemek", selection: $foodPreference) {
          Text("Tavuk").tag("Tavuk")
          Text("Balık").tag("Balık")
          Text("Kırmızı Et").tag("Kırmızı Et")
          Text("Tahıl").tag("Tahıl")
          Text("Vegan ").tag("Vegan")
          Text("Hindi").tag("Hindi")
        }
        .pickerStyle(WheelPickerStyle())
        
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
