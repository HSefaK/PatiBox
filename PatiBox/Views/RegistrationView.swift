// RegistrationView content here...
import SwiftUI

// MARK: - RegistrationView
struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Kayıt Ol")
                        .font(.largeTitle)
                        .bold()

                    TextField("Adınız", text: $viewModel.userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    TextField("E-posta", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Picker("Evcil Hayvan Türü", selection: $viewModel.petType) {
                        ForEach(PetType.allCases, id: \PetType.rawValue) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()

                    TextField("Hayvan İsmi", text: $viewModel.petName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Stepper("Yaş: \(viewModel.petAge)", value: $viewModel.petAge, in: 0...20)
                        .padding()

                    TextField("Kilo", value: $viewModel.petWeight, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Picker("Beslenme Tercihi", selection: $viewModel.foodPreference) {
                        ForEach(FoodPreference.allCases, id: \FoodPreference.rawValue) { preference in
                            Text(preference.rawValue).tag(preference)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()

                    Button("Kaydı Tamamla") {
                        viewModel.completeRegistration()
                    }
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Kayıt Ol")
        }
    }
}
