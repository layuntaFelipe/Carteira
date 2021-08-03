//
//  SIdeMenuView.swift
//  Carteira
//
//  Created by Felipe Lobo on 03/08/21.
//

import SwiftUI

struct SIdeMenuView: View {
    
    @Binding var selectedTab: String
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Image(systemName: "person")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
                .padding(.top, 50)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Felipe Lobo")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Button(action: {
                    
                }, label: {
                    Text("View Profile")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .opacity(0.7)
                })
            }
            
            VStack(alignment: .leading, spacing: 10){
                TabButton(image: "house", title: "Home", selectedTab: $selectedTab, animation: animation)

                TabButton(image: "clock.arrow.circlepath", title: "History", selectedTab: $selectedTab, animation: animation)

                TabButton(image: "bell.badge", title: "Notifications", selectedTab: $selectedTab, animation: animation)

                TabButton(image: "gearshape.fill", title: "Settings", selectedTab: $selectedTab, animation: animation)

                TabButton(image: "questionmark.circle", title: "Help", selectedTab: $selectedTab, animation: animation)
            }
            .padding(.leading, -15)
            .padding(.top, 50)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 6, content: {
                TabButton(image: "rectangle.righthalf.inset.fill.arrow.right", title: "Log out", selectedTab: .constant(""), animation: animation)
                    .padding(.leading, -15)
                
                Text("App Version 1.2.34")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.6)
            })
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SIdeMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
