//
//  OnboardingView.swift
//  Carteira
//
//  Created by Felipe Lobo on 02/08/21.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView {
            TabView {
                ForEach(cards, id: \.self) { card in
                    PresentationView(card: card)
                }
            }// TAB
            .tabViewStyle(PageTabViewStyle())
            .padding(.vertical, 20)
            .navigationTitle("OnboardCards")
            .navigationBarHidden(true)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
