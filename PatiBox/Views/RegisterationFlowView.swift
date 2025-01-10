//
//  RegisterationFlowView.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 8.01.2025.
//

import Foundation
import SwiftUI

struct RegistrationFlowView: View {
    @State private var currentStep: Int = 1
    @State private var selectedAnimal: String = ""
    @State private var gender: String = ""
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var weight: String = ""
    @State private var foodPreference: String = ""
    @State private var consumptionType: String = ""
    @State private var subscriptionDuration: Int = 0
    @State private var deliveryPeriod: Int = 1
    @State private var includesToy: Bool = false
    @State private var includesLitter: Bool = false
    @State private var includesVitamin: Bool = false
    @State private var includesTablet: Bool = false
    @State private var foodBrand: String = ""
    @State private var litterBrand: String = ""
    @State private var manualConsumptionAmount: String = ""
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            if currentStep == 1 {
                AnimalSelectionView(selectedAnimal: $selectedAnimal, onNext: {
                    if selectedAnimal.isEmpty {
                        print("Hayvan seçimi gerekli")
                    } else {
                        currentStep = 2
                    }
                })
            } else if currentStep == 2 {
                GenderAndNameView(gender: $gender, name: $name, onNext: {
                    if gender.isEmpty || name.isEmpty {
                        print("Cinsiyet ve isim gerekli")
                    } else {
                        currentStep = 3
                    }
                })
            } else if currentStep == 3 {
                AgeAndWeightView(age: $age, weight: $weight, onNext: {
                    if age.isEmpty || weight.isEmpty {
                        print("Yaş ve kilo gerekli")
                    } else {
                        currentStep = 4
                    }
                })
            } else if currentStep == 4 {
                FoodPreferenceView(foodPreference: $foodPreference, onNext: {
                    if foodPreference.isEmpty {
                        print("Yemek tercihi gerekli")
                    } else {
                        currentStep = 5
                    }
                })
            } else if currentStep == 5 {
                ConsumptionView(consumptionType: $consumptionType, manualConsumptionAmount: $manualConsumptionAmount, onNext: {
                    if consumptionType.isEmpty || (consumptionType == "Manuel" && manualConsumptionAmount.isEmpty) {
                        print("Tüketim bilgisi gerekli")
                    } else {
                        currentStep = 6
                    }
                })
            } else if currentStep == 6 {
                ProductOptionsView(includesToy: $includesToy, includesLitter: $includesLitter, includesVitamin: $includesVitamin, includesTablet: $includesTablet, selectedAnimal: $selectedAnimal, onNext: {
                    currentStep = 7
                })
            } else if currentStep == 7 {
                BrandSelectionView(selectedAnimal: $selectedAnimal, foodBrand: $foodBrand, litterBrand: $litterBrand, includesLitter: $includesLitter, onNext: {
                    if foodBrand.isEmpty || (selectedAnimal == "Kedi" && includesLitter && litterBrand.isEmpty) {
                        print("Marka bilgisi gerekli")
                    } else {
                        currentStep = 8
                    }
                })
            } else if currentStep == 8 {
                SubscriptionCalculationView(selectedAnimal: $selectedAnimal, weight: $weight, subscriptionDuration: $subscriptionDuration, includesLitter: $includesLitter, onNext: {
                    currentStep = 9
                })
            } else if currentStep == 9 {
                DeliveryPeriodView(deliveryPeriod: $deliveryPeriod, onNext: {
                    currentStep = 10
                })
            } else if currentStep == 10 {
                CheckoutView(
                    selectedAnimal: $selectedAnimal,
                    foodBrand: $foodBrand,
                    litterBrand: $litterBrand,
                    subscriptionDuration: $subscriptionDuration,
                    deliveryPeriod: $deliveryPeriod,
                    includesToy: $includesToy,
                    includesVitamin: $includesVitamin,
                    includesTablet: $includesTablet, 
                    includesLitter: $includesLitter,
                    foodPreference: $foodPreference,
                    onComplete: {
                        print("Kayıt tamamlandı!")
                    }
                )
            }
        }
        .padding()
    }
}
