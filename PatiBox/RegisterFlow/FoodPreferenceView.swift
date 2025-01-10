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

            Button("İleri") { onNext() }
                .buttonStyle(PrimaryButtonStyle())
        }
    }
}
