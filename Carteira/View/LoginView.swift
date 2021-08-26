//
//  LoginView.swift
//  Carteira
//
//  Created by Felipe Lobo on 02/08/21.
//

import SwiftUI
import AuthenticationServices
import FirebaseAuth

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var currentNonce: String?
    
    @EnvironmentObject var firebaseAppModel: FirebaseAppModel
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack(alignment: .leading, spacing: 20){
                    
                    VStack(alignment: .leading){
                        Text("Hey,")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Login Now :)")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    HStack{
                        Text("If you are new /")
                            .foregroundColor(.gray)
                        
                        NavigationLink(
                            destination: RegisterView(),
                            label: {
                                Text("Create New")
                            })
                    }
                    
                    VStack{
                        TextField("Email", text: $email)
                            .frame(width: 280, height: 45)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.gray.opacity(0.2))
                            )
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        
                        
                        SecureField("Password", text: $password)
                            .frame(width: 280, height: 45)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.gray.opacity(0.2))
                            )
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                    
                    Button(action: {
                        print("Login")
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        firebaseAppModel.signIn(email: email, password: password)
                        
                    }, label: {
                        Text("Login")
                            .frame(width: 280, height: 45)
                            .font(.system(size: 20, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 7)
                                    .foregroundColor(.black)
                            )
                    })
                    .padding(.vertical,30)
                    
                    SignInWithAppleButton(
                        onRequest: { request in
                            let nonce = firebaseAppModel.randomNonceString()
                            currentNonce = nonce
                            request.requestedScopes = [.fullName, .email]
                            request.nonce = firebaseAppModel.sha256(nonce)
                        },
                        onCompletion: { result in
                            switch result {
                            case .success(let authResults):
                                switch authResults.credential {
                                case let appleIDCredential as ASAuthorizationAppleIDCredential:
                                    
                                    guard let nonce = currentNonce else {
                                        fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                    }
                                    guard let appleIDToken = appleIDCredential.identityToken else {
                                        fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                    }
                                    guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                                        print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                                        return
                                    }
                                    
                                    let credential = OAuthProvider.credential(withProviderID: "apple.com",idToken: idTokenString,rawNonce: nonce)
                                    Auth.auth().signIn(with: credential) { (authResult, error) in
                                        if (error != nil) {
                                            // Error. If error.code == .MissingOrInvalidNonce, make sure
                                            // you're sending the SHA256-hashed nonce as a hex string with
                                            // your request to Apple.
                                            print(error?.localizedDescription as Any)
                                            return
                                        }
                                        print("signed in")
                                        self.firebaseAppModel.appleSignIn()
                                    }
                                    
                                    print("\(String(describing: Auth.auth().currentUser?.uid))")
                                default:
                                    break
                                    
                                }
                            default:
                                break
                            }
                        }
                    ).frame(width: 280, height: 45)
                    
                    
                }
            }
            .navigationTitle("Login")
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .offset(y: -40)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
