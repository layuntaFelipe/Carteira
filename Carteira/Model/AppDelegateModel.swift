//
//  AppDelegateModel.swift
//  Carteira
//
//  Created by Felipe Lobo on 03/08/21.
//

import Foundation
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
}
