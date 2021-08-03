//
//  DashboardView.swift
//  Carteira
//
//  Created by Felipe Lobo on 02/08/21.
//

import SwiftUI

struct DashboardView: View {
    
    @EnvironmentObject var firebaseAppModel: FirebaseAppModel
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    Text("name")
                    Text("email")
                    Text("password")
                    Text("Photo")
                    Button(action: {
                        firebaseAppModel.signOut()
                    }, label: {
                        Text("Sign out")
                    })
                }
            }
            .navigationTitle("Carteira")
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
