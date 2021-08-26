//
//  DatabaseManager.swift
//  Carteira
//
//  Created by Felipe Lobo on 2021-08-25.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
}

//MARK: - Account Management
extension DatabaseManager {
    
    public func userExists(with email: String, completion: @escaping ((Bool) -> Void)) {
        
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "]", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "[", with: "-")
        
        database.child(safeEmail).observeSingleEvent(of: .value) { snapShot in
            guard snapShot.value as? String != nil else {
                completion(false)
                return
            }
            
            completion(true)
        }
    }
    
    ///Insert new user to database
    public func insertUser(with user: CarteiraAppUser) {
        database.child(user.safeEmail).setValue([
            "name": user.name
        ])
    }
    
    public func getUser(email: String) {
        database.child(email).observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: String] else {
                return
            }
            
            print("Value: \(value)")
        }
    }
    
}

struct CarteiraAppUser {
    let name: String
    let emailAddress: String
    var safeEmail: String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "]", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "[", with: "-")
        return safeEmail
    }
//    let profilePictureUrl: URL
}
