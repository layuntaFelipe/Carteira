//
//  PresentationView.swift
//  Carteira
//
//  Created by Felipe Lobo on 02/08/21.
//

import SwiftUI

struct PresentationView: View {
    
    var card: Card
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack{
            Color(card.cardFirstColor)
            
            VStack(spacing: 20){
                
                CardView(balance: card.cardBalance, name: card.cardName, firstColor: card.cardFirstColor, secondColor: card.cardSecondColor, offSet: card.cardOffset)
                    .frame(width: 250, height: 150)
                    .scaleEffect(1.4)
                    .offset(x: isAnimating ? 110 : -110, y: 0)
                    .rotationEffect(.degrees(isAnimating ? 10 : -10))
                    .padding(.vertical, 60)
                
                Text("Carteira")
                    .font(.system(size: 30, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.top)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation")
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom)
            
                PresentationCardButton(card: card)
            }
        }
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 0.8)) {
                isAnimating = true
            }
        })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}

struct PresentationView_Previews: PreviewProvider {
    
    static let card = cards[2]
    
    static var previews: some View {
        PresentationView(card: card)
            .previewLayout(.sizeThatFits)
    }
}
