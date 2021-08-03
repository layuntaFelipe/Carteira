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
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let firebaseAppModel = FirebaseAppModel()
            ContentView()
                .environmentObject(firebaseAppModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
