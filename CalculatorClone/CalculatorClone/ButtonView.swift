//
//  ButtonView.swift
//  CalculatorClone
//
//  Created by KoJeongseok on 2022/05/29.
//

import SwiftUI

struct ButtonView: View {
    
    var size: CGFloat
    var text: String
    var color: Color
    var backgroundColor: Color
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: size, height: size)
                .foregroundColor(backgroundColor)
            
            Text(text)
                .foregroundColor(color)
                .font(.system(size: size / 2))
                
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(size: 100, text: "5", color: .white, backgroundColor: Color("orange"))
    }
}
