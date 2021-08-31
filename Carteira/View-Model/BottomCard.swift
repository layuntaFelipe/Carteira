//
//  BottomCard.swift
//  Carteira
//
//  Created by Felipe Lobo on 2021-08-30.
//

import SwiftUI

struct BottomCard<Content: View>: View {
    
    let content: Content
    let height: CGFloat
    @Binding var cardShown: Bool
    @Binding var cardDismissal: Bool
    
    init(cardShown: Binding<Bool>,
         cardDismissal: Binding<Bool>,
         height: CGFloat,
        @ViewBuilder content: () -> Content) {
        _cardDismissal = cardDismissal
        _cardShown = cardShown
        self.height = height
        self.content = content()
    }
    
    var body: some View {
        ZStack{
            Color("background").opacity(0.2)
            
            //Card
            VStack{
                Spacer()
                VStack{
                    content
                        .frame(width: UIScreen.main.bounds.width)
                    
                }
                .background(Color("background").opacity(0.5))
                .frame(height: height)
                .offset(y: cardDismissal && cardShown ? 0 : height)
                .animation(Animation.default.delay(0.2))
            }
        }
        .edgesIgnoringSafeArea(.all)
        .opacity(cardShown ? 1 : 0)
        .animation(Animation.easeIn)
        .onTapGesture {
            //Dismiss
            cardDismissal.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now()+0.25) {
                cardShown.toggle()
            }
        }
    }
}

struct CardContent: View {
    
    var card: Card
    @Binding var cardShown: Bool
    @Binding var cardDismissal: Bool
    
    var body: some View {
        ZStack{
            VStack{
                CardAdd(card: card)
                HStack{
                    Button(action: {
                        
                    }, label: {
                        ZStack{
                            LinearGradient(gradient: Gradient(colors: [Color("darkOrange"), Color("lightOrange")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        }
                        .frame(width: 60, height: 37)
                        .cornerRadius(10)
                    })
                    Button(action: {
                        
                    }, label: {
                        ZStack{
                            LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        }
                        .frame(width: 60, height: 37)
                        .cornerRadius(10)
                    })
                    Button(action: {
                        
                    }, label: {
                        ZStack{
                            LinearGradient(gradient: Gradient(colors: [Color("darkGray"), Color("lightGray")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        }
                        .frame(width: 60, height: 37)
                        .cornerRadius(10)
                    })
                    Button(action: {
                        
                    }, label: {
                        ZStack{
                            LinearGradient(gradient: Gradient(colors: [Color("darkGreen"), Color("lightGreen")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        }
                        .frame(width: 60, height: 37)
                        .cornerRadius(10)
                    })
                    Button(action: {
                        
                    }, label: {
                        ZStack{
                            LinearGradient(gradient: Gradient(colors: [Color("darkPurple"), Color("lightPurple")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        }
                        .frame(width: 60, height: 37)
                        .cornerRadius(10)
                    })
                }
                .padding()
                
                Button(action: {
                    cardDismissal.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.25) {
                        cardShown.toggle()
                    }
                }, label: {
                    Text("Add New Card")
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

struct CardAdd: View {
    
    var card: Card
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(card.cardFirstColor), Color(card.cardSecondColor)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack{
                HStack{
                    Text(card.cardName)
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding()
                        .padding(.horizontal,5)
                    
                    Spacer()
                }//HSTACK
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Budget")
                            .foregroundColor(.white)
                        
                        Text("$ \(card.cardBalance)")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                    }//VSTACK
                    .padding()
                    Spacer()
                }//HSTACK
            }//VSTACK
        }//ZSTACK
        .frame(width: 300, height: 186)
        .cornerRadius(20)
        .shadow(color: Color(card.cardFirstColor).opacity(0.3), radius: 8, x: 5, y: 5)
    }
}
