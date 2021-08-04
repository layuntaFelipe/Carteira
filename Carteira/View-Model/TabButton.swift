//
//  TabButton.swift
//  Carteira
//
//  Created by Felipe Lobo on 03/08/21.
//

import SwiftUI

struct TabButton: View {
    var image: String
    var title: String
    
    @Binding var selectedTab: String
    
    @EnvironmentObject var firebaseAppModel: FirebaseAppModel
    
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedTab = title
            }
            
            if title == "Log out" {
                firebaseAppModel.signOut()
            }
        }, label: {
            HStack(spacing: 15){
                Image(systemName: image)
                    .font(.title2)
                    .frame(width: 30)
                
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(selectedTab == title ? .blue : .white)
            .padding(.vertical,12)
            .padding(.horizontal,10)
            // Max Frame
            .frame(width: getRect().width - 170, alignment: .leading)
            .background(
                ZStack{
                    if selectedTab == title {
                        Color.white
                            .opacity(selectedTab == title ? 1 : 0)
                            .clipShape(CustomCorners(corners: [.topRight, .bottomRight], radious: 10))
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
            )
        })
    }
}

struct TabButton_Previews: PreviewProvider {
    
    @Namespace static var animation
    
    static var previews: some View {
        TabButton(image: "house", title: "Home", selectedTab: .constant("Home"), animation: animation)
    }
}
