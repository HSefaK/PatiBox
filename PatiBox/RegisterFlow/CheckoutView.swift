//
//  CheckoutView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

import SwiftUI

struct CheckoutView: View {
  @State private var showDetails: Bool = false
  @State private var navigateToPayment: Bool = false
  @Binding var selectedAnimal: String
  @Binding var foodBrand: String
  @Binding var litterBrand: String
  @Binding var subscriptionDuration: Int
  @Binding var deliveryPeriod: Int
  @Binding var includesToy: Bool
  @Binding var includesVitamin: Bool
  @Binding var includesTablet: Bool
  @Binding var includesLitter: Bool
  @Binding var foodPreference: String
  var onComplete: () -> Void
  @Environment(\.colorScheme) var colorScheme
  
  var totalPrice: Double {
    var price = 0.0
    if selectedAnimal == "Kedi" {
      price += Constants.Prices.catFoodPerKg
    } else if selectedAnimal == "Köpek" {
      price += Constants.Prices.dogFoodPerKg
    }
    if selectedAnimal == "Kedi" && includesLitter {
      price += (litterBrand == "Everclean" ? Constants.Prices.evercleanLitterPerKg : Constants.Prices.otherLitterPerKg) * Double(subscriptionDuration)
    }
    if includesToy { price += Constants.Prices.toy }
    if includesVitamin { price += Constants.Prices.vitamin }
    if includesTablet { price += Constants.Prices.tablet }
    price *= Double(subscriptionDuration)
    price *= (12.0 / Double(deliveryPeriod))
    return price
  }
  
  var body: some View {
    VStack(spacing: 20) {
      Text("Kasa")
        .font(.largeTitle)
        .bold()
        .foregroundColor(.accentColor)
      
      Group {
        Text("Mama Markası: \(foodBrand)")
        Text("Mama İçeriği: \(foodPreference)")
        if selectedAnimal == "Kedi" {
          Text("Kum Markası: \(litterBrand)")
        }
        Text("Abonelik Süresi: \(subscriptionDuration) Ay")
        Text("Gönderim Periyodu: \(deliveryPeriod) Hafta")
        if includesToy { Text("Oyuncak: Var") }
        if includesVitamin { Text("Vitamin: Var") }
        if includesTablet { Text("Aşı/Parazit: Var") }
      }
      .font(.title3)
      
      Button(action: {
        showDetails.toggle()
      }) {
        Text("Toplam Ücret: \(String(format: "%.2f", totalPrice)) TL")
          .font(.title2)
          .bold()
          .foregroundColor(.accentColor)
          .padding(.bottom)
      }
      .sheet(isPresented: $showDetails) {
        CheckoutDetailsView(
          selectedAnimal: $selectedAnimal,
          foodBrand: $foodBrand,
          litterBrand: $litterBrand,
          subscriptionDuration: $subscriptionDuration,
          deliveryPeriod: $deliveryPeriod,
          includesToy: $includesToy,
          includesVitamin: $includesVitamin,
          includesTablet: $includesTablet,
          foodPreference: $foodPreference,
          totalPrice: totalPrice
        )
      }
      
      Button(action: {
        navigateToPayment = true
      }) {
        if colorScheme == .dark {
          Text("Tamamla")
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
          Text("Tamamla")
            .padding(.vertical,16)
            .frame(maxWidth: .infinity)
            .background(
              LinearGradient(gradient: Gradient(colors: [AppColors.textPrimaryPurple, AppColors.textSecondaryOrange]), startPoint: .leading, endPoint: .trailing)
            )
            .foregroundColor(AppColors.textBackgroundWhite)
            .cornerRadius(10)
            .padding(.horizontal,8)
          
        }
        NavigationLink(
          destination: PaymentView(totalPrice: totalPrice),
          isActive: $navigateToPayment,
          label: { EmptyView() }
        )
      }
      .padding()
      .background(Color(uiColor: .clear))
      .cornerRadius(20)
      .shadow(color: Color.secondary.opacity(0.4), radius: 10, x: 0, y: 4)
    }
  }
  
}
