//
//  OutcomeIncomeView.swift
//  Carteira
//
//  Created by Felipe Lobo on 19/08/21.
//

import SwiftUI

struct OutcomeIncomeView: View {
    var body: some View {
        Group{
            HStack{
                
                Image(systemName: "cart.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color("sidePannel"))
                    .frame(width: 70, height: 70)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Shopping")
                        .fontWeight(.bold)
                        .foregroundColor(Color("sidePannel"))
                    
                    Text("Today")
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Text("-$120.00")
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("sidePannel"))
            }
        }
        .padding()
        .background(Color("groupBoxColor"))
        .cornerRadius(20)
    }
}

struct OutcomeIncomeView_Previews: PreviewProvider {
    static var previews: some View {
        OutcomeIncomeView()
            .previewLayout(.sizeThatFits)
    }
}
