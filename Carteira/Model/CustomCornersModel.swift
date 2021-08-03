//
//  CustomCornersModel.swift
//  Carteira
//
//  Created by Felipe Lobo on 03/08/21.
//

import SwiftUI

struct CustomCorners: Shape {
    
    var corners: UIRectCorner
    var radious: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radious, height: radious))
        
        return Path(path.cgPath)
    }
}
