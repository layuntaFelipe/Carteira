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
                Color.black.ignoresSafeArea()
                Color.purple.opacity(0.15).ignoresSafeArea()
                ScrollView{
                    HStack{
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                        })
                        .padding()
                    }
                    
                    HStack{
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                        
                        Text("Hi, Felipe!")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
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
                        GroupBox{
                            VStack(alignment: .leading){
                                Text("Total Balance")
                                Text("$ 12.000")
                            }
                        }
                        Spacer()
                        GroupBox{
                            VStack(alignment: .leading){
                                Text("Monthly Spend")
                                Text("$ 3.410")
                            }
                        }
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
                            .foregroundColor(.white)
                            .padding()
                        Spacer()
                    }
                    
                    ForEach(0...10, id: \.self){ text in
                        Text("Test")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
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
