//
//  ProductOptionsView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

struct ProductOptionsView: View {
    @Binding var includesToy: Bool
    @Binding var includesLitter: Bool
    @Binding var includesVitamin: Bool
    @Binding var includesTablet: Bool
    @Binding var selectedAnimal: String
    var onNext: () -> Void
  @Environment(\.colorScheme) var colorScheme

  var body: some View {
    VStack(spacing: 20) {
      Text("Ürün Seçenekleri")
        .font(.title2)
      
      Toggle("Oyuncak", isOn: $includesToy)
      if selectedAnimal == "Kedi" {
        Toggle("Kum", isOn: $includesLitter)
      }
      Toggle("Vitamin", isOn: $includesVitamin)
      Toggle("İç Dış Parazit Tableti", isOn: $includesTablet)
      
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
