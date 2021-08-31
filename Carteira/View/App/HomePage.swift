//
//  HomePage.swift
//  Carteira
//
//  Created by Felipe Lobo on 04/08/21.
//

import SwiftUI

struct HomePage: View {
    
    let firebaseAppModel = FirebaseAppModel()
    @State var cardShown = false
    @State var cardDismissal = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top){
                Color("background").ignoresSafeArea()
                ScrollView(showsIndicators: false){
                    HStack{
                        Spacer()
                        
                        Button(action: {
                            print("Button clicked")
                            cardShown.toggle()
                            cardDismissal.toggle()
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
                .blur(radius: cardShown ? 20 : 0)
                
                BottomCard(cardShown: $cardShown, cardDismissal: $cardDismissal, height: UIScreen.main.bounds.height/2.1) {
                    CardContent(card: cards[0], cardShown: $cardShown, cardDismissal: $cardDismissal)
                        .padding()
                }
                .animation(.default)
            }
            .navigationBarHidden(true)
            
            
        }
        .onAppear {
            firebaseAppModel.getUserInfo()
        }
        
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            
    }
}
