//
//  SubscriptionCalculationView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

struct SubscriptionCalculationView: View {
    @Binding var selectedAnimal: String
    @Binding var weight: String
    @Binding var subscriptionDuration: Int
    @Binding var includesLitter: Bool
    var onNext: () -> Void
  @Environment(\.colorScheme) var colorScheme

  var body: some View {
    VStack(spacing: 20) {
      Text("Abonelik Hesaplama")
        .font(.largeTitle)
        .bold()
        .foregroundColor(.indigo)
      
      Picker("Abonelik Süresi (Ay)", selection: $subscriptionDuration) {
        ForEach(0..<13) { value in
          Text("\(value) Ay").tag(value)
        }
      }
      .pickerStyle(WheelPickerStyle())
      .padding()
      
      Text(selectedAnimal == "Köpek" ? dogConsumption(weight: weight) : catConsumption(weight: weight))
        .font(.title2)
        .multilineTextAlignment(.center)
      
      if selectedAnimal == "Kedi" && includesLitter {
        Text(catLitterConsumption())
          .font(.title2)
          .multilineTextAlignment(.center)
      }
      
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
    func dogConsumption(weight: String) -> String {
        guard let weightValue = Int(weight) else { return "Geçersiz ağırlık" }
        let dailyGram: Int
        switch weightValue {
        case 1...3: dailyGram = 50
        case 4...5: dailyGram = 100
        case 6...10: dailyGram = 150
        case 11...15: dailyGram = 250
        case 16...20: dailyGram = 350
        case 21...25: dailyGram = 450
        case 26...30: dailyGram = 550
        case 31...40: dailyGram = 650
        case 41...50: dailyGram = 750
        default: dailyGram = 850
        }
        return "Günlük Mama Miktarı: \(dailyGram) gram\nToplam: \(dailyGram * 30 * subscriptionDuration) gram"
    }

    func catConsumption(weight: String) -> String {
        guard let weightValue = Int(weight) else { return "Geçersiz ağırlık" }
        let dailyGram: Int
        switch weightValue {
        case 1: dailyGram = 15
        case 2: dailyGram = 25
        case 3: dailyGram = 40
        case 4: dailyGram = 55
        case 5: dailyGram = 70
        case 6: dailyGram = 85
        case 7...: dailyGram = 105
        default: dailyGram = 0
        }
        return "Günlük Mama Miktarı: \(dailyGram) gram\nToplam: \(dailyGram * 30 * subscriptionDuration) gram"
    }

    func catLitterConsumption() -> String {
        let dailyLitterConsumption = 300 // Ortalama günlük tüketim gram
        let totalLitter = dailyLitterConsumption * 30 * subscriptionDuration
        return "Günlük Kum Miktarı: \(dailyLitterConsumption) gram\nToplam: \(totalLitter / 1000) kg"
    }
}
