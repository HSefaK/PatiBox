//
//  AgeandWeightView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

struct AgeAndWeightView: View {
    @Binding var age: String
    @Binding var weight: String
    var onNext: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Yaş ve Kilo")
                .font(.title2)

            TextField("Yaş", text: $age)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Kilo", text: $weight)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("İleri") { onNext() }
                .buttonStyle(PrimaryButtonStyle())
        }
    }
}
