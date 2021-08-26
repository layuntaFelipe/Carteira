//
//  BottomCardView.swift
//  Carteira
//
//  Created by Felipe Lobo on 23/08/21.
//

import SwiftUI

struct BottomCardView<Content: View>: View {
    
    let content: Content
    @Binding var cardShown: Bool
    @Binding var cardDismiss: Bool
    let height: CGFloat
    
    init(cardDismiss: Binding<Bool>, cardShown: Binding<Bool>, height: CGFloat, @ViewBuilder content: () -> Content) {
        _cardShown = cardShown
        _cardDismiss = cardDismiss
        self.height = height
        self.content = content()
    }
    
    var body: some View {
        ZStack{
            GeometryReader{ _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.5))
            .opacity(cardShown ? 1 : 0)
            .animation(.easeIn)
            .onTapGesture {
                dismiss()
            }
            
            VStack{
                Spacer()
                VStack{
                    content
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Dismiss")
                            .foregroundColor(Color.white)
                            .frame(width: UIScreen.main.bounds.width/2, height: 50)
                            .background(Color.pink)
                            .cornerRadius(8)
                    })
                }
                .background(Color.white)
                .frame(height: height)
                .offset(y: cardDismiss && cardShown ? 0 : height)
                .animation(Animation.default.delay(0.2))
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func dismiss() {
        cardDismiss.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.25) {
            cardShown.toggle()
        }
    }
}
