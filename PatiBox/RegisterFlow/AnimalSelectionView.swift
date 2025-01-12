//
//  AnimalSelectionView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

struct AnimalSelectionView: View {
    @Binding var selectedAnimal: String
    var onNext: () -> Void
  @Environment(\.colorScheme) var colorScheme

    var body: some View {
      VStack(spacing: 20) {
        Text("Hayvanınızı Seçin")
          .font(.title2)
        
        Picker("Hayvan", selection: $selectedAnimal) {
          Text("Kedi").tag("Kedi")
          Text("Köpek").tag("Köpek")
        }
        .pickerStyle(SegmentedPickerStyle())
        
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
        }
      }
    }
}
