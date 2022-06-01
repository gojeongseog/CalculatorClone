//
//  Home.swift
//  CalculatorClone
//
//  Created by KoJeongseok on 2022/05/31.
//

import SwiftUI

struct Home: View {
    
    @State var left: Double = 0
    @State var op: String = ""
    @State var right: Double = 0
    
    @State private var displayText: String = "0"
    @State private var isDisplay: Bool = false
    
    
    
    let size: CGFloat = UIScreen.main.bounds.width / 5
    let padding: CGFloat = UIScreen.main.bounds.width / 25
    let buttonTextArr: [[String]] = [["AC", "+/-", "%", "÷"], ["7", "8", "9", "×"], ["4", "5", "6", "-"], ["1", "2", "3", "+"], ["0", ".", "="]]
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(displayText)
                        .font(.system(size: size))
                        .foregroundColor(.white)
                        .padding(padding)
                }
                .padding(.leading, padding)
                .padding(.trailing, padding)
                
                VStack {
                    ForEach(buttonTextArr, id: \.self) { arr in
                        HStack {
                            ForEach(arr, id: \.self) { text in
                                Button(action: {
                                    // 버튼 액션
                                    
                                    switch text {
                                    case "AC", "+/-", "%":
                                        stateBtn(text: text)
                                    case "7", "8", "9", "4", "5", "6", "1", "2", "3", "0":
                                        numBtn(text: text)
                                    case ".":
                                        dotBtn(text: text)
                                    case "÷", "×", "-", "+":
                                        operationBtn(text: text)
                                    case "=":
                                        equal(isEqual: true)
                                    default:
                                        print("1")
                                    }
                                    
                                }, label: {
                                    // 버튼 UI
                                    
                                    switch text {
                                    case "AC", "+/-", "%":
                                        ButtonView(size: size, text: text, color: .black, backgroundColor: Color("gray"))
                                            .padding(.trailing, padding)
                                            .padding(.bottom, padding)
                                    case "7", "8", "9", "4", "5", "6", "1", "2", "3", ".":
                                        ButtonView(size: size, text: text, color: .white, backgroundColor: Color("darkgray"))
                                            .padding(.trailing, padding)
                                            .padding(.bottom, padding)
                                    case "÷", "×", "-", "+", "=":
                                        ButtonView(size: size, text: text, color: .white, backgroundColor: Color("orange"))
                                            .padding(.trailing, padding)
                                            .padding(.bottom, padding)
                                    default:
                                        ZeroButtonView(size: size, text: text, color: .white, backgroundColor: Color("darkgray"))
                                            .padding(.trailing, padding)
                                            .padding(.bottom, padding)
                                        
                                    }
                                })
                            }
                        }
                    }
                }
                .padding(.leading, padding)
            }
        }
    }
}

extension Home {
    
    func dotBtn(text: String) {
        if isDisplay {
            if displayText.contains(text) {
                return
            } else {
                displayText += "."
            }
            
        } else {
            displayText = "0."
        }
        isDisplay = true
        
    }
    
    
    // 숫자버튼 액션
    func numBtn(text: String) {
        if isDisplay {
            displayText += text
        } else {
            displayText = text
        }
        isDisplay = true
    }

    // 상태버튼 액션
    func stateBtn(text: String) {
        
        switch text {
        case "AC":
            displayText = "0"
            left = 0
            isDisplay = false
        case "+/-":
            displayText = String(Double(displayText)! * -1)
        case "%":
            displayText = String(Double(displayText)! / 100)
//            isDisplay = false
        default:
            print("stateBtn error")
        }
    }
    // 연산버튼
    func operationBtn(text: String) {
        //"÷", "×", "-", "+", "="
        op = text
        
        if left == 0 {
            left = Double(displayText)!
            
            isDisplay = false
        } else {
            equal(isEqual: false)
        }
    }
    
    func equal(isEqual: Bool) {
        
        var result: Double = 0
        
        right = Double(displayText)!
        switch op {
        case "÷":
            result = left / right
        case "×":
            result = left * right
        case "-":
            result = left - right
        case "+":
            result = left + right
        default:
            print("Operation error")
        }
        left = isEqual ? 0 : left
        
        // 소숫점 마지막이 0이 되지 않게 하기 위한 구문
        if result == Double(Int(result)) {
            displayText = String(Int(result))
        } else {
            displayText = String(result)
        }
            
        isDisplay = false
        
    }
    
//    func convert(text : String, result: Double) {
//
//
//
//        if result == Double(Int(result)) {
//            result = Double(Int(result))
//        }
//        displayText = numberFormatter.string(from: NSNumber(value: result))
//
//    }
//
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
