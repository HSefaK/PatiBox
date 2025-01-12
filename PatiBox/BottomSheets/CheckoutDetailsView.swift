//
//  CheckoutSheet.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

struct CheckoutDetailsView: View {
  @Binding var selectedAnimal: String
  @Binding var foodBrand: String
  @Binding var litterBrand: String
  @Binding var subscriptionDuration: Int
  @Binding var deliveryPeriod: Int
  @Binding var includesToy: Bool
  @Binding var includesVitamin: Bool
  @Binding var includesTablet: Bool
  @Binding var foodPreference: String
  var totalPrice: Double
  @Environment(\.colorScheme) var colorScheme
  @Environment(\.dismiss) var dismiss // This is the key to closing the view

  var body: some View {
    VStack(spacing: 20) {
      Text("Detaylı Fatura")
        .font(.largeTitle)
        .bold()
        .foregroundColor(.accentColor)
      
      Divider()
      
      Group {
        TextRow(title: "Mama Markası", value: foodBrand)
        TextRow(title: "Mama İçeriği", value: foodPreference)
        TextRow(title: "Mama KG Fiyatı", value: selectedAnimal == "Kedi" ? "\(Constants.Prices.catFoodPerKg) TL/kg" : "\(Constants.Prices.dogFoodPerKg) TL/kg")
        
        if selectedAnimal == "Kedi" {
          TextRow(title: "Kum Markası", value: litterBrand)
          TextRow(title: "Kum Fiyatı", value: litterBrand == "Everclean" ? "\(Constants.Prices.evercleanLitterPerKg) TL/kg" : "\(Constants.Prices.otherLitterPerKg) TL/kg")
        }
        
        TextRow(title: "Abonelik Süresi", value: "\(subscriptionDuration) Ay")
        TextRow(title: "Gönderim Periyodu", value: "\(deliveryPeriod) Ayda 1 Kere")
        
        if includesToy {
          TextRow(title: "Oyuncak", value: "\(Constants.Prices.toy) TL")
        }
        
        if includesVitamin {
          TextRow(title: "Vitamin", value: "\(Constants.Prices.vitamin) TL")
        }
        
        if includesTablet {
          TextRow(title: "Aşı/Parazit", value: "\(Constants.Prices.tablet) TL")
        }
      }
      
      Divider()
      
      Text("Toplam Ücret: \(String(format: "%.2f", totalPrice)) TL")
        .font(.title2)
        .bold()
        .minimumScaleFactor(0.5)
        .lineLimit(1)
        .padding()
      
      Button(action: {
        dismiss()
      }) {
        if colorScheme == .dark {
          Text("Kapat")
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
          Text("Kapat")
            .padding(.vertical,16)
            .frame(maxWidth: .infinity)
            .background(
              LinearGradient(gradient: Gradient(colors: [AppColors.textPrimaryPurple, AppColors.textSecondaryOrange]), startPoint: .leading, endPoint: .trailing)
            )
            .foregroundColor(AppColors.textBackgroundWhite)
            .cornerRadius(10)
            .padding(.horizontal,8)
          
        }        }
      .padding()
      .background(Color(uiColor: .clear))
      .cornerRadius(20)
      .shadow(color: Color.secondary.opacity(0.4), radius: 10, x: 0, y: 4)
      .padding()
    }
  }
}
