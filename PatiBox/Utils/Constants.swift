//
//  Constants.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 9.01.2025.
//

import Foundation
import SwiftUI

struct Constants {
    struct Prices {
        static let catFoodPerKg: Double = 1500.0
        static let dogFoodPerKg: Double = 750.0
        static let evercleanLitterPerKg: Double = 120.0
        static let otherLitterPerKg: Double = 110.0
        static let toy: Double = 600.0
        static let vitamin: Double = 1500.0
        static let tablet: Double = 2000.0
    }
  
  struct APILinks {
    static let mainAPIURL: String = "https://9e5ecac0-0e08-4d41-8a01-681f4ca7351b-00-1gb4u5p2wt4wh.sisko.replit.dev/"
  }
}

struct AppColors {
    static let backgroundStartLight = Color(UIColor(red: 1.00, green: 0.95, blue: 0.91, alpha: 1.00))
    static let backgroundEndDark = Color(UIColor(red: 1.00, green: 0.95, blue: 0.91, alpha: 1.00))
    static let buttonBackgroundOrange = Color(UIColor(red: 0.99, green: 0.65, blue: 0.35, alpha: 1.00))
    static let textPrimaryPurple = Color(UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00))
    static let textSecondaryOrange = Color(UIColor(red: 0.99, green: 0.65, blue: 0.35, alpha: 1.00))
    static let accent = Color(UIColor(red: 1.00, green: 0.44, blue: 0.38, alpha: 1.00))
    static let textBackgroundWhite = Color(UIColor(red: 1.00, green: 1, blue: 1, alpha: 1.00))

}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex

        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = Double((rgbValue >> 16) & 0xFF) / 255.0
        let green = Double((rgbValue >> 8) & 0xFF) / 255.0
        let blue = Double(rgbValue & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

