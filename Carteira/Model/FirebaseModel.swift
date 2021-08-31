//
//  FirebaseModel.swift
//  Carteira
//
//  Created by Felipe Lobo on 03/08/21.
//

import Foundation
import FirebaseAuth
import CryptoKit

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
    
    func appleSignIn() {
        DispatchQueue.main.async {
            self.signedIn = true
        }
    }
    
    func signUp(userName: String, email: String, password: String) {
        
        DatabaseManager.shared.userExists(with: email) { [weak self] exists in
            guard !exists else {
                //User already exists
                print("User already exists")
                return
            }
            
            self?.auth.createUser(withEmail: email, password: password) { [weak self] result, error in
                guard result != nil, error == nil else {
                    return
                }
                
                // Success
                DatabaseManager.shared.insertUser(with: CarteiraAppUser(name: userName, emailAddress: email))
                DispatchQueue.main.async {
                    self?.signedIn = true
                }
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
    
    func getUserInfo() {
        guard var safeEmail = auth.currentUser?.email else {
            return
        }
        safeEmail = safeEmail.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "]", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "[", with: "-")
        
        print("Calling DatabaseManage to get user info")
        DatabaseManager.shared.getUser(email: safeEmail)
    }
    
}

extension FirebaseAppModel {
    
    func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: Array<Character> =
          Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }
    
    func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        return String(format: "%02x", $0)
      }.joined()

      return hashString
    }
}
