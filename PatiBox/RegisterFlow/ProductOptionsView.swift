//
//  ProductOptionsView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

struct ProductOptionsView: View {
    @Binding var includesToy: Bool
    @Binding var includesLitter: Bool
    @Binding var includesVitamin: Bool
    @Binding var includesTablet: Bool
    @Binding var selectedAnimal: String
    var onNext: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Ürün Seçenekleri")
                .font(.title2)

            Toggle("Oyuncak", isOn: $includesToy)
            if selectedAnimal == "Kedi" {
                Toggle("Kum", isOn: $includesLitter)
            }
            Toggle("Vitamin", isOn: $includesVitamin)
            Toggle("İç Dış Parazit Tableti", isOn: $includesTablet)

            Button("İleri") { onNext() }
                .buttonStyle(PrimaryButtonStyle())
        }
    }
}
