//
//  ZeroButtonView.swift
//  CalculatorClone
//
//  Created by KoJeongseok on 2022/05/31.
//

import SwiftUI

struct ZeroButtonView: View {
    var size: CGFloat
    var text: String
    var color: Color
    var backgroundColor: Color
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: size / 2)
                .frame(width: size * 2 + size / 5, height: size)
                .foregroundColor(backgroundColor)
            
            Text(text)
                .foregroundColor(color)
                .font(.system(size: size / 2))
                .padding(.leading, size / 3)
        }
    }
}

struct ZeroButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZeroButtonView(size: 100, text: "5", color: .white, backgroundColor: Color("orange"))
    }
}
