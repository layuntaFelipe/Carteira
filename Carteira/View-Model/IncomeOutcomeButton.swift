//
//  IncomeOutcomeButton.swift
//  Carteira
//
//  Created by Felipe Lobo on 20/08/21.
//

import SwiftUI

struct IncomeOutcomeButton: View {
    
    @Binding var cardShown: Bool
    @Binding var cardDismissal: Bool
    var imageArrow: String
    var buttonTitle: String
    var buttonColor: String
    
    var body: some View {
        Button(action: {
            print(buttonTitle)
            cardShown.toggle()
            cardDismissal.toggle()
        }, label: {
            ZStack{
                Color(buttonColor)
                HStack{
                    Image(systemName: imageArrow)
                        .foregroundColor(.white)
                    
                    Text(buttonTitle)
                        .foregroundColor(.white)
                }
                .padding()
            }
            .cornerRadius(10)
        })
    }
}
