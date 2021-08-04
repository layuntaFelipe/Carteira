//
//  HomeView.swift
//  Carteira
//
//  Created by Felipe Lobo on 03/08/21.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var selectedTab: String
    
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab){
                HomePage()
                    .tag("Home")
                    .navigationBarHidden(true)
                
                History()
                    .tag("History")
                    .navigationBarHidden(true)
                
                Notifications()
                    .tag("Notifications")
                    .navigationBarHidden(true)
                
                Settings()
                    .tag("Settings")
                    .navigationBarHidden(true)
                
                Help()
                    .tag("Help")
                    .navigationBarHidden(true)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct History: View {
    var body: some View {
        ZStack(alignment: .top) {
            Text("History")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
        }
    }
}

struct Notifications: View {
    var body: some View {
        ZStack {
            Text("Notifications")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
        }
    }
}

struct Settings: View {
    var body: some View {
        ZStack {
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
        }
    }
}
struct Help: View {
    var body: some View {
        ZStack {
            Text("Help")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
        }
    }
}

