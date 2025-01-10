//
//  PaymentView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 9.01.2025.
//

import Foundation
import SwiftUI

struct PaymentView: View {
    let totalPrice: Double

    var body: some View {
        VStack(spacing: 20) {
            Text("Ödeme Sayfası")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.accentColor)

            Text("Toplam Ödenecek Tutar: \(String(format: "%.2f", totalPrice)) TL")
                .font(.title2)
                .padding()

            Button("Ödemeyi Tamamla") {
                print("Ödeme işlemi tamamlandı!")
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding()

            Spacer()
        }
        .padding()
        .background(Color(uiColor: .systemBackground))
        .cornerRadius(20)
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}
