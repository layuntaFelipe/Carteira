//
//  RegisterView.swift
//  Carteira
//
//  Created by Felipe Lobo on 02/08/21.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var name: String = ""
    @State private var userPhoto: UIImage = UIImage(systemName: "person.circle")!
    
    @EnvironmentObject var firebaseAppModel: FirebaseAppModel
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack(alignment: .leading, spacing: 20){
                    
                    VStack(alignment: .leading){
                        Text("New here ?")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Let's get you Register :)")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    VStack{
                        
                        Button(action: {
                            
                        }, label: {
                            ZStack(alignment: .bottom){
                                Image(uiImage: userPhoto)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 100)
                            }
                        })
                        
                        TextField("Name", text: $name)
                            .frame(width: 250, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.gray.opacity(0.2))
                            )
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        
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
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        firebaseAppModel.signUp(email: email, password: password)
                    }, label: {
                        Text("Register")
                            .frame(width: 250, height: 50)
                            .font(.system(size: 20, weight: .medium, design: .rounded))
                            .foregroundColor(.black)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(lineWidth: 2.5)
                                    .foregroundColor(.black)
                            )
                    })
                    .padding(.vertical,30)
                }
            }
            .navigationTitle("Register")
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .offset(y: -40)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
