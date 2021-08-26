//
//  BarChartView.swift
//  Carteira
//
//  Created by Felipe Lobo on 20/08/21.
//

import SwiftUI

struct BarChartView: View {
    
    @State var pickerSelectedItem = 0
    @State var incomeDataPoints: [[CGFloat]] = [
        [50, 100, 150, 20, 130, 90, 50],
        [150, 90, 50, 120, 30, 30, 60],
        [80, 100, 60, 200, 90, 10, 80]
    ]
    @State var outcomeDataPoints: [[CGFloat]] = [
        [150, 90, 50, 120, 30, 30, 60],
        [80, 100, 60, 200, 90, 10, 80],
        [50, 100, 150, 20, 130, 90, 50]
    ]
    
    var body: some View {
        ZStack{
            VStack{
                Picker(selection: $pickerSelectedItem, label: Text(""), content: {
                    Text("Today").tag(0)
                    Text("Yesterday").tag(1)
                    Text("Weekday").tag(2)
                }).pickerStyle(SegmentedPickerStyle())
                
                HStack(spacing: 15){
                    ForEach(0..<incomeDataPoints[0].count, id: \.self) { number in
                        BarView(incomeValue: incomeDataPoints[pickerSelectedItem][number], outcomeValue: outcomeDataPoints[pickerSelectedItem][number])
                    }
                }
                .animation(.default)
            }
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
            .previewLayout(.sizeThatFits)
    }
}

struct BarView: View {
    
    var incomeValue: CGFloat
    var outcomeValue: CGFloat
//    var incomeColor: String
//    var outcomeColor: String
    
    var body: some View {
        HStack(spacing: 5){
            ZStack(alignment:.bottom){
                Capsule().frame(width: 15, height: 200)
                    .foregroundColor(.blue.opacity(0.2))
                Capsule().frame(width: 15, height: incomeValue)
                    .foregroundColor(.blue)
            }
            ZStack(alignment:.bottom){
                Capsule().frame(width: 15, height: 200)
                    .foregroundColor(.red.opacity(0.2))
                Capsule().frame(width: 15, height: outcomeValue)
                    .foregroundColor(.red)
            }
        }
    }
}
