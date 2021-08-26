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
    
    @State private var changeProfileImage = false
    @State private var openCameraRoll = false
    @State private var userPhoto = UIImage()
    
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
                            changeProfileImage = true
                            openCameraRoll = true
                        }, label: {
                            if changeProfileImage {
                                Image(uiImage: userPhoto)
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "person")
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .clipShape(Circle())
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
                        firebaseAppModel.signUp(userName: name, email: email, password: password)
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
            .sheet(isPresented: $openCameraRoll){
                ImagePicker(selectedImage: $userPhoto, sourceType: .photoLibrary)
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
