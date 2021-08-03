//
//  CardView.swift
//  Carteira
//
//  Created by Felipe Lobo on 02/08/21.
//

import SwiftUI

struct CardView: View {
    //MARK: - PROPERTIES
    var balance: String
    var name: String
    var firstColor: String
    var secondColor: String
    var offSet: CGFloat?
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(firstColor), Color(secondColor)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack{
                HStack{
                    Text(name)
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
                        
                        Text("$ \(balance)")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                    }//VSTACK
                    .padding()
                    Spacer()
                }//HSTACK
            }//VSTACK
        }//ZSTACK
        .cornerRadius(20)
        .offset(y: offSet ?? 0)
        .shadow(color: Color(firstColor).opacity(0.3), radius: 8, x: 5, y: 5)
    }
}

//MARK: - PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(balance: "1.333,33", name: "NuBank Card", firstColor: "darkOrange", secondColor: "lightOrange")
            .previewLayout(.sizeThatFits)
    }
}
