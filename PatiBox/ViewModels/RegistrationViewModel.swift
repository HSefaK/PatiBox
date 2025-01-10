// RegistrationViewModel content here...
import SwiftUI

// MARK: - RegistrationViewModel
class RegistrationViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var petType: PetType = .dog
    @Published var petName: String = ""
    @Published var petAge: Int = 0
    @Published var petWeight: Double = 0.0
    @Published var foodPreference: FoodPreference = .chicken

    func completeRegistration() {
        // Logic to save the user profile and navigate to the next screen
        print("Registration completed for \(userName)")
    }
}
