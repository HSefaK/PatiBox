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

    var body: some View {
        VStack(spacing: 20) {
            Text("Gönderim Periyodu")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.indigo)

            Picker("Gönderim Periyodu (Ay)", selection: $deliveryPeriod) {
                ForEach([1, 2, 3, 4, 6], id: \ .self) { value in
                    Text("\(value) Ay").tag(value)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .padding()

            Button("Tamam") {
                onNext()
            }
            .buttonStyle(PrimaryButtonStyle())
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}
