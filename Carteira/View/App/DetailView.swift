//
//  DetailView.swift
//  Carteira
//
//  Created by Felipe Lobo on 20/08/21.
//

import SwiftUI

struct DetailView: View {
    
    var card: Card
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("background")
                    .ignoresSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    CardView(balance: card.cardBalance, name: card.cardName, firstColor: card.cardFirstColor, secondColor: card.cardSecondColor, offSet: card.cardOffset)
                        .frame(width: 300, height: 186)
                    
                    HStack{
                        IncomeOutcomeButton(imageArrow: "arrow.down.square", buttonTitle: "Income", buttonColor: card.cardFirstColor)
                        
                        IncomeOutcomeButton(imageArrow: "arrow.up.square", buttonTitle: "Outcome", buttonColor: card.cardSecondColor)
                    }
                    
                    HStack {
                        Spacer()
                        Group{
                            VStack(alignment: .leading){
                                Text("Total Balance")
                                    .foregroundColor(Color("sidePannel"))
                                Text("$ 12.000")
                                    .foregroundColor(Color("sidePannel"))
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .foregroundColor(Color("groupBoxColor"))
                                .frame(width: 150, height: 80, alignment: .leading)
                        )
                        
                        Spacer()
                        Group{
                            VStack(alignment: .leading){
                                Text("Monthly Spend")
                                    .foregroundColor(Color("sidePannel"))
                                Text("$ 3.410")
                                    .foregroundColor(Color("sidePannel"))
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .foregroundColor(Color("groupBoxColor"))
                                .frame(width: 150, height: 80, alignment: .leading)
                        )
                        Spacer()
                    }
                    .padding(.vertical)
                        
                    
                    HStack{
                        Text("Card's Statistic")
                        
                        Spacer()
                    }
                    HStack{
                        Text("Card's History")
                        
                        Spacer()
                    }
                    
                })
            }
            
            
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailView(card: cards[0])
    }
}
