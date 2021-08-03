//
//  LoginView.swift
//  Carteira
//
//  Created by Felipe Lobo on 02/08/21.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
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
                            .frame(width: 250, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.gray.opacity(0.2))
                            )
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
        
                        
                        SecureField("Password", text: $password)
                            .frame(width: 250, height: 50)
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
                            .frame(width: 250, height: 50)
                            .font(.system(size: 20, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.black)
                            )
                    })
                    .padding(.vertical,30)
                    
                    HStack(alignment: .center, spacing: 35) {
                        Button(action: {
                            
                        }, label: {
                            Text("Apple")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Facebook")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Google")
                        })
                    }
                    
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
