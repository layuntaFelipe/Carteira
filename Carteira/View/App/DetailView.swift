//
//  DetailView.swift
//  Carteira
//
//  Created by Felipe Lobo on 20/08/21.
//

import SwiftUI

struct DetailView: View {
    
    var card: Card
    @State var cardShown = false
    @State var cardDismissal = false
    @State private var amount: Double = 0.0
    @State private var isFocused: Bool = false
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
        formatter.numberStyle = .currency
            return formatter
        }()
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("background")
                    .ignoresSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    CardView(balance: card.cardBalance, name: card.cardName, firstColor: card.cardFirstColor, secondColor: card.cardSecondColor, offSet: card.cardOffset)
                        .frame(width: 300, height: 186)
                    
                    HStack{
                        IncomeOutcomeButton(cardShown: $cardShown, cardDismissal: $cardDismissal, imageArrow: "arrow.down.square", buttonTitle: "Income", buttonColor: card.cardFirstColor)
                            .frame(width: 120, height: 40, alignment: .center)
                            .padding(.horizontal)
                        
                        IncomeOutcomeButton(cardShown: $cardShown, cardDismissal: $cardDismissal, imageArrow: "arrow.up.square", buttonTitle: "Outcome", buttonColor: card.cardSecondColor)
                            .frame(width: 120, height: 40, alignment: .center)
                            .padding(.horizontal)
                    }
                    .padding()
                    
                    HStack {
                        Spacer()
                        Group{
                            VStack(alignment: .leading){
                                Text("Total Balance")
                                    .foregroundColor(Color.gray)
                                    .font(.subheadline)
                                Text("$ 12.000")
                                    .foregroundColor(Color("sidePannel"))
                                    .fontWeight(.semibold)
                                    .font(.body)
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
                                    .foregroundColor(Color.gray)
                                    .font(.subheadline)
                                Text("$ 3.410")
                                    .foregroundColor(Color("sidePannel"))
                                    .fontWeight(.semibold)
                                    .font(.body)
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
                        
                    
                    Group {
                        HStack{
                            Text("Card's Statistic")
                            Spacer()
                        }
                        GroupBox{
                            BarChartView()
                        }
                        .padding()
                    }
                    
                    
                    
                    HStack{
                        Text("Card's History")
                        
                        Spacer()
                    }
                    
                    ForEach(0...10, id: \.self){ text in
                        OutcomeIncomeView()
                            .padding()
                    }
                    
                })
                
                BottomCard(cardShown: $cardShown, cardDismissal: $cardDismissal, height: UIScreen.main.bounds.height/3.5) {
                    ZStack{
                        
                        Color("background").opacity(0.2)
                        
                        VStack{
                            
                            TextField("Amount", value: $amount, formatter: formatter)
                                .font(.system(size: 30, weight: .semibold, design: .rounded))
                                .foregroundColor(.blue)
                                .keyboardType(.numberPad)
                                .padding()
                            
                            Spacer()
                            
                            Button(action: {
                                cardDismissal.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now()+0.25) {
                                    cardShown.toggle()
                                }
                            }, label: {
                                Text("Add Income")
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.main.bounds.width/2, height: 50)
                                    .background(Color(card.cardFirstColor))
                                    .cornerRadius(8)
                            })
                            .padding()
                        }
                    }
                }
            }
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailView(card: cards[0])
    }
}
