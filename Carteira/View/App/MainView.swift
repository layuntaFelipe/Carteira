//
//  MainView.swift
//  Carteira
//
//  Created by Felipe Lobo on 03/08/21.
//

import SwiftUI

struct MainView: View {
    
    @State var selectedTab = "Home"
    @State var showMenu = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.ignoresSafeArea()
                
                //SIde Menu
                SIdeMenuView(selectedTab: $selectedTab)
                
                ZStack{
                    // 2 background cards...
                    Color.white
                        .opacity(0.5)
                        .cornerRadius(showMenu ? 15 : 0)
                        .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                        .offset(x: showMenu ? -25 : 0)
                        .padding(.vertical, 30)
                    
                    Color.white
                        .opacity(0.4)
                        .cornerRadius(showMenu ? 15 : 0)
                        .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                        .offset(x: showMenu ? -50 : 0)
                        .padding(.vertical, 60)
                    
                    HomeView(selectedTab: $selectedTab)
                        .cornerRadius(showMenu ? 15 : 0)
                }
                .scaleEffect(showMenu ? 0.84 : 1)
                .offset(x: showMenu ? getRect().width - 120 : 0)
                .ignoresSafeArea()
                .overlay(
                    
                    //MEnu Button
                    Button(action: {
                        withAnimation(.spring()){
                            showMenu.toggle()
                        }
                    }, label: {
                        // Animated Drawer Button
                        VStack(spacing: 5){
                            Capsule()
                                .fill(showMenu ? Color.white : Color.primary)
                                .frame(width: 30, height: 3)
                                .rotationEffect(.init(degrees: showMenu ? -50 : 0))
                                .offset(x: showMenu ? 2 : 0, y: showMenu ? 9 : 0)
                            VStack(spacing: 5){
                                Capsule()
                                    .fill(showMenu ? Color.white : Color.primary)
                                    .frame(width: 30, height: 3)
                                Capsule()
                                    .fill(showMenu ? Color.white : Color.primary)
                                    .frame(width: 30, height: 3)
                                    .offset(y: showMenu ? -8 : 0)
                            }
                            .rotationEffect(.init(degrees: showMenu ? 50 : 0))
                        }
                    })
                    .padding()
                    
                    ,alignment: .topLeading
                )
                
                
            }//ZSTACK
            .navigationBarHidden(true)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//Extenfin View to get screen size
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
