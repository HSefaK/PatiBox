//
//  DeliveryPeriodView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

struct DeliveryPeriodView: View {
  @Binding var deliveryPeriod: Int
  var onNext: () -> Void
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    VStack(spacing: 20) {
      Text("Gönderim Periyodu")
        .font(.largeTitle)
        .bold()
        .foregroundColor(Color(uiColor: .label))
      
      Picker("Gönderim Periyodu (Ay)", selection: $deliveryPeriod) {
        ForEach([1, 2, 3, 4, 6, 12], id: \ .self) { value in
          Text("\(value) Ay").tag(value)
        }
      }
      .pickerStyle(WheelPickerStyle())
      .padding()
      
      Button(action: {
        onNext()
      }) {
        if colorScheme == .dark {
          Text("Tamam")
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
          Text("Tamam")
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
    }
  }
}
