//
//  BrandSelection.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

struct BrandSelectionView: View {
  @Binding var selectedAnimal: String
  @Binding var foodBrand: String
  @Binding var litterBrand: String
  @Binding var includesLitter: Bool
  var onNext: () -> Void
  @Environment(\.colorScheme) var colorScheme
  
  let catBrands = [
    "Acana", "Advance", "Brit Care", "Cat Chow", "Dr. Sacchi", "Econature", "Enjoy", "Felicia", "Hill’s", "Lavital", "Mystic", "N&D", "Orijen", "Pro Choice", "Proplan", "Pronature", "Properformance", "Reflex", "Royal Canin", "Vida"
  ].sorted()
  
  let dogBrands = [
    "Acana", "Advance", "Brit Care", "Brit Veterinary", "Farmina", "Felicia", "Hill’s", "LaVital", "Mera", "N&D", "Orijen", "Pro Choice", "Proplan", "Reflex", "Royal Canin"
  ].sorted()
  
  let catLitterBrands = [
    "Active Clean", "Biokat's", "Bioline", "Catit", "Cats Best", "CatsGREY", "City Cat", "Clean Step", "Ewox", "Ever Clean", "Garden Mix", "Perlinette", "ProClean", "Proline", "PROONE", "Quik", "Reflex", "Resteril", "Sandy", "Sanicat", "Trendline", "Ultra Care"
  ].sorted()
  
  var body: some View {
    VStack(spacing: 20) {
      Text("Marka Tercihi")
        .font(.largeTitle)
        .bold()
        .foregroundColor(.indigo)
      
      Text("Mama Markası Seçiniz")
        .font(.headline)
        .padding(.top)
      
      Picker("Mama Markası", selection: $foodBrand) {
        if selectedAnimal == "Kedi" {
          ForEach(catBrands, id: \ .self) { brand in
            Text(brand).tag(brand)
          }
        } else if selectedAnimal == "Köpek" {
          ForEach(dogBrands, id: \ .self) { brand in
            Text(brand).tag(brand)
          }
        }
      }
      .pickerStyle(WheelPickerStyle())
      .padding()
      
      if selectedAnimal == "Kedi" && includesLitter {
        Text("Kum Markası Seçiniz")
          .font(.headline)
          .padding(.top)
        
        Picker("Kum Markası", selection: $litterBrand) {
          ForEach(catLitterBrands, id: \ .self) { brand in
            Text(brand).tag(brand)
          }
        }
        .pickerStyle(WheelPickerStyle())
        .padding()
      }
      
      Button(action: {
        onNext()
      }) {
        if colorScheme == .dark {
          Text("İleri")
            .padding(.vertical,16)
            .frame(maxWidth: .infinity)
            .background(
              LinearGradient(gradient: Gradient(colors: [AppColors.textPrimaryPurple, AppColors.textSecondaryOrange]), startPoint: .leading, endPoint: .trailing)
                .opacity(0)
            )
            .border(LinearGradient(gradient: Gradient(colors: [AppColors.textPrimaryPurple, AppColors.textSecondaryOrange]), startPoint: .leading, endPoint: .trailing), width: 4 )
            .foregroundColor(AppColors.textBackgroundWhite)
            .cornerRadius(10)
            .padding(.horizontal,8)
        } else {
          Text("İleri")
            .padding(.vertical,16)
            .frame(maxWidth: .infinity)
            .background(
              LinearGradient(gradient: Gradient(colors: [AppColors.textPrimaryPurple, AppColors.textSecondaryOrange]), startPoint: .leading, endPoint: .trailing)
            )
            .foregroundColor(AppColors.textBackgroundWhite)
            .cornerRadius(10)
            .padding(.horizontal,8)
          
        }        }
      .padding()
      .background(Color(uiColor: .clear))
      .cornerRadius(20)
      .shadow(color: Color.secondary.opacity(0.4), radius: 10, x: 0, y: 4)
    }
  }
}
