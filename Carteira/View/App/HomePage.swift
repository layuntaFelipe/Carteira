//
//  HomePage.swift
//  Carteira
//
//  Created by Felipe Lobo on 04/08/21.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .top){
                Color("background").ignoresSafeArea()
                ScrollView(showsIndicators: false){
                    HStack{
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color("sidePannel"))
                                .frame(width: 40, height: 40)
                        })
                        .padding()
                    }
                    
                    HStack{
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("sidePannel"))
                            .frame(width: 50, height: 50)
                        
                        Text("Hi, Felipe!")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("sidePannel"))
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    
                    Text("Let's make your banking needs easy!")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        .padding()
                    
                    
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
                    
                    
                    WalletView(cardsNumber: cards.count, cards: cards, show: false)
                        .animation(.easeIn)
                        .padding()
                    
                    
                    HStack{
                        Text("History")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("sidePannel"))
                            .padding()
                        Spacer()
                    }
                    
                    ForEach(0...10, id: \.self){ text in
                        OutcomeIncomeView()
                            .padding()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            
    }
}
