//
//  GenderandNameView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

struct GenderAndNameView: View {
    @Binding var gender: String
    @Binding var name: String
    var onNext: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Cinsiyet ve İsim")
                .font(.title2)

            Picker("Cinsiyet", selection: $gender) {
                Text("Erkek").tag("Erkek")
                Text("Dişi").tag("Dişi")
            }
            .pickerStyle(SegmentedPickerStyle())

            TextField("İsim", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("İleri") { onNext() }
                .buttonStyle(PrimaryButtonStyle())
        }
    }
}
