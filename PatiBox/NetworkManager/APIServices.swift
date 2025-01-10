//
//  APIServices.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 10.01.2025.
//

import Foundation

class APIService {
    static let baseURL = "https://9e5ecac0-0e08-4d41-8a01-681f4ca7351b-00-1gb4u5p2wt4wh.sisko.replit.dev"

    // Kullanıcı Kaydı
    static func registerUser(firstName: String, lastName: String, email: String, password: String, phone: String, address: String, completion: @escaping (Result<String, Error>) -> Void) {
        let url = URL(string: "\(baseURL)/api/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: String] = [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "password": password,
            "phone": phone,
            "address": address
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                completion(.failure(NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: "Hata Kodu: \(response.statusCode)"])))
                return
            }

            completion(.success("Kayıt başarılı"))
        }.resume()
    }

    // Marka Fiyatını Getir
    static func getBrandPrice(animalType: String, brandType: String, brandName: String, litterBrand: String?, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        let url = URL(string: "\(baseURL)/api/brands?animalType=\(animalType)&brandType=\(brandType)&brandName=\(brandName)\(litterBrand != nil ? "&litterBrand=\(litterBrand!)" : "")")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                completion(.failure(NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: "Hata Kodu: \(response.statusCode)"])))
                return
            }

            if let data = data {
                do {
                    let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    completion(.success(result ?? [:]))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }

    // Kullanıcı Verilerini ve Fiyatları Kaydet ve Getir
    static func submitDetails(animalType: String, brandType: String, brandName: String, litterBrand: String?, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        let url = URL(string: "\(baseURL)/api/brands")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "animalType": animalType,
            "brandType": brandType,
            "brandName": brandName,
            "litterBrand": litterBrand ?? NSNull()
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                completion(.failure(NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: "Hata Kodu: \(response.statusCode)"])))
                return
            }

            if let data = data {
                do {
                    let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    completion(.success(result ?? [:]))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
