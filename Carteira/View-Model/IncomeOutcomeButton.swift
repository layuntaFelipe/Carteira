//
//  IncomeOutcomeButton.swift
//  Carteira
//
//  Created by Felipe Lobo on 20/08/21.
//

import SwiftUI

struct IncomeOutcomeButton: View {
    
    var imageArrow: String
    var buttonTitle: String
    var buttonColor: String
    
    var body: some View {
        Button(action: {
            print(buttonTitle)
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

struct IncomeOutcomeButton_Previews: PreviewProvider {
    static var previews: some View {
        IncomeOutcomeButton(imageArrow: "arrow.down.square", buttonTitle: "Income", buttonColor: "darkOrange")
            .previewLayout(.sizeThatFits)
    }
}
