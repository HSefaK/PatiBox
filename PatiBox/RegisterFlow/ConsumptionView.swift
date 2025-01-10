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

            Button("İleri") { onNext() }
                .buttonStyle(PrimaryButtonStyle())
        }
    }
}
