//
//  ConsumptionView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

struct ConsumptionView: View {
    @Binding var consumptionType: String
    @Binding var manualConsumptionAmount: String
    var onNext: () -> Void
  @Environment(\.colorScheme) var colorScheme

  var body: some View {
    VStack(spacing: 20) {
      Text("Aylık Tüketim")
        .font(.title2)
      
      Picker("Tüketim", selection: $consumptionType) {
        Text("Otomatik Hesapla").tag("Otomatik")
        Text("Manuel Gir").tag("Manuel")
      }
      .pickerStyle(SegmentedPickerStyle())
      
      if consumptionType == "Manuel" {
        TextField("Manuel Tüketim Miktarı", text: $manualConsumptionAmount)
          .textFieldStyle(RoundedBorderTextFieldStyle())
      }
      
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
