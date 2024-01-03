//
//  ContentView.swift
//  Calculator
//
//  Created by Luca Blanco Marchese on 16.12.23.
//

import SwiftUI

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "x"
    case equal = "="
    case clear  = "C"
    case clearAll  = "AC"
    case decimal  = ","
    case negative  = "-/+"
    
    var buttonColor: Color {
        
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return .gray
        case .clear, .clearAll:
            return .red
        case .negative:
            return Color(.lightGray)
        default:
            return Color.orange
        }
    }
}

enum Operation {
    case add, subtract, multiply, divide, none
}


struct ContentView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    
    let buttons: [[CalcButton]] = [
        
        [.clear, .clearAll, .negative, .add],
        [.seven, .eight, .nine, .subtract],
        [.four, .five, .six, .multiply],
        [.one, .two, .three, .divide,],
        [.zero, .decimal, .equal],
    ]
    
    
    
    var body: some View {
        VStack {
            
            //display Text
            Spacer()
            HStack {
                Spacer()
                Text(value)
                    .font(.system(size: 72))
                    
            }
            .padding()
            
            //display Buttons
      
            
            ForEach(buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                        Button(action: {
                            self.didTap(button: item)
                        },
                               label: {
                            
                            Text(item.rawValue)
                           
                                .font(.system(size: 30))
                                .frame(
                                    width: buttonWidth(item: item), height: buttonHeight(item: item))
                                .background(item.buttonColor)
                                .foregroundColor(.white)
                                .cornerRadius(buttonWidth(item: item) / 2)
                        })
                        
                    }
                }
                .padding(.bottom, 3)
            }
            
        }
        
    }
    func didTap(button: CalcButton) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                self.currentOperation = .add
                self.runningNumber = Int(self.value) ?? 0
            }
            if button == .subtract {
                self.currentOperation = .subtract
                self.runningNumber = Int(self.value) ?? 0
            }
            if button == .multiply {
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0
            }
            if button == .divide {
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0
            }
            if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation {
                case .add: self.value = "\(runningValue + currentValue)"
                case .subtract: self.value = "\(runningValue - currentValue)"
                case .multiply: self.value = "\(runningValue * currentValue)"
                case .divide: self.value = "\(runningValue / currentValue)"
                case .none:
                    break;
                }
            }
            
            if button != .equal {
                self.value = "0"
            }
        case .clearAll, .clear:
            self.value = "0"
        case .decimal, .negative:
            break
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
        
        }
    }


    func buttonWidth(item: CalcButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
        }
        return ((UIScreen.main.bounds.width - (5*12)) / 4)
    }

    func buttonHeight(item: CalcButton) -> CGFloat {
        return ((UIScreen.main.bounds.width - (5*12)) / 4)
    }

}


                                   
                                   

#Preview {
    ContentView()
}
