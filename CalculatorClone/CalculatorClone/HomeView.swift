//
//  HomeView.swift
//  CalculatorClone
//
//  Created by KoJeongseok on 2022/05/29.
//

import SwiftUI

struct HomeView: View {
    
    @State var displayText: String = "0"
    @State var isDisplayText: Bool = false
    
    let size = UIScreen.main.bounds.width / 4
    let spacing: CGFloat = 10
    @State private var numberOfRows = 4
    
    private var ButtonText: [String] = ["AC", "+/-", "%", "÷", "7", "8", "9", "×", "4", "5", "6", "-", "1", "2", "3", "+", "0", "0", ".", "="]
    
    //    private var stateBtnText: [String] = ["AC", "+/-", "%"]
    //
    //    private var operateBtnText: [String] = ["÷", "×", "-", "+", "="]
    
    var body: some View {
        
        let columns = Array(repeating: GridItem(.flexible(), spacing: spacing), count: numberOfRows)
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Text(displayText)
                        .foregroundColor(.white)
                        .font(.system(size: size))
                        .padding(5)
                }
                
                
                
                LazyVGrid(columns: columns, spacing: spacing) {
                    ForEach(0 ..< 20) { num in
                        Button(action: {
                            if num < 3 {
//                                switch num {
//                                case 0:
//                                    acBtn()
//                                case 1:
//                                    negative()
//                                case 2:
//                                    percentage()
//                                    case
//                                default:
//                                    print("ok")
//                                    
//                                    
//                                }
                                
                            } else if num % 4 == 3 {
                                
                            } else {
                                if isDisplayText {
                                    displayText += ButtonText[num]
                                } else {
                                    displayText = ButtonText[num]
                                    isDisplayText = true
                                }
                                
                            }
                        }, label: {
//                            if num < 3 {
//                                ButtonView(size: size * 0.9, text: ButtonText[num], color: .black, backgroundColor: Color("gray"))
//                            } else if num % 4 == 3 {
//                                ButtonView(size: size * 0.9, text: ButtonText[num], color: .white, backgroundColor: Color("orange"))
//                            } else {
//                                ButtonView(size: size * 0.9, text: ButtonText[num], color: .white, backgroundColor: Color("darkgray"))
//                            }
                        })
                    }
                }
            }
            
        }
    }
    
    
    func acBtn() {
        displayText = "0"
        isDisplayText = false
    }
    
    func negative() {
        displayText = "-" + displayText
    }
    
    func percentage() {
        displayText = String(Float(displayText)! / Float(100))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

