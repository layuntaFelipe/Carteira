//
//  CarteiraApp.swift
//  Carteira
//
//  Created by Felipe Lobo on 09/06/21.
//

import SwiftUI

@main
struct CarteiraApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
