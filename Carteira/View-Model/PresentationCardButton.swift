//
//  PresentationCardButton.swift
//  Carteira
//
//  Created by Felipe Lobo on 02/08/21.
//

import SwiftUI

struct PresentationCardButton: View {
    
    var card: Card
    
    var body: some View {
        
        NavigationLink(
            destination: LoginView(),
            label: {
                ZStack{
                    Capsule(style: .continuous)
                        .stroke(Color(card.cardSecondColor), lineWidth: 2)
                        .frame(width: 200, height: 50)
                        .padding()
                    
                    Text("Next")
                        .font(.system(size: 25, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                }
            })
        .padding()
    }
}

struct PresentationCardButton_Previews: PreviewProvider {
    
    static let card = cards[1]
    
    static var previews: some View {
        PresentationCardButton(card: card)
            .previewLayout(.sizeThatFits)
    }
}
