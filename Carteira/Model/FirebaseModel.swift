//
//  FirebaseModel.swift
//  Carteira
//
//  Created by Felipe Lobo on 03/08/21.
//

import Foundation
import FirebaseAuth

class FirebaseAppModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn: Bool = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            // Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            // Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
    
}
