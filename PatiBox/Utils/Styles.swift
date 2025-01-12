//
//  Styles.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

struct LightOrDarkModeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
      @Environment(\.colorScheme) var colorScheme
      if colorScheme == .dark {
        configuration.label
        .background(
          LinearGradient(gradient: Gradient(colors: [AppColors.textPrimaryPurple, AppColors.textSecondaryOrange]), startPoint: .leading, endPoint: .trailing)
            .preferredColorScheme(.dark)
            .opacity(0)
        )
        .border(LinearGradient(gradient: Gradient(colors: [AppColors.textPrimaryPurple, AppColors.textSecondaryOrange]), startPoint: .leading, endPoint: .trailing), width: 4 )
        .foregroundColor(AppColors.textBackgroundWhite)
        .cornerRadius(10)
        .padding()
      } else {
        configuration.label
        .background(
          LinearGradient(gradient: Gradient(colors: [.pink, .mint]), startPoint: .leading, endPoint: .trailing)
        )
//        .border(LinearGradient(gradient: Gradient(colors: [AppColors.textPrimaryPurple, AppColors.textSecondaryOrange]), startPoint: .leading, endPoint: .trailing), width: 4 )
        .foregroundColor(AppColors.textBackgroundWhite)
        .cornerRadius(10)
        .padding()
      }

    }
}


