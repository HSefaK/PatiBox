import SwiftUI

enum ProductCategory: String, CaseIterable, Identifiable {
    case all = "Tüm Ürünler"
    case cat = "Kedi"
    case dog = "Köpek"

    var id: String { self.rawValue }
}
