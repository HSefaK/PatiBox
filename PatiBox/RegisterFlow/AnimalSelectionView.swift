//
//  AnimalSelectionView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

struct AnimalSelectionView: View {
    @Binding var selectedAnimal: String
    var onNext: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Hayvanınızı Seçin")
                .font(.title2)

            Picker("Hayvan", selection: $selectedAnimal) {
                Text("Kedi").tag("Kedi")
                Text("Köpek").tag("Köpek")
            }
            .pickerStyle(SegmentedPickerStyle())

            Button("İleri") { onNext() }
                .buttonStyle(PrimaryButtonStyle())
        }
    }
}
