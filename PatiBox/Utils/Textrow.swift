//
//  Textrow.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 9.01.2025.
//

import Foundation
import SwiftUI

struct TextRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title + ":")
                .font(.headline)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            Spacer()
            Text(value)
                .font(.subheadline)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal)
    }
}

