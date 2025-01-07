//
//  PatiBoxApp.swift
//  PatiBox
//
//  Created by Hüseyin Sefa Küçük on 7.01.2025.
//

import SwiftUI

@main
struct PatiBoxApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
