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
}

struct ContentView: View {
    
    let buttons: [[CalcButton]] = [
        
        [.negative, .clear, .clearAll, .add],
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
                Text("0")
                    .font(.system(size: 52))
                    .bold()
            }
            .padding()
            
            //display Buttons
            Spacer()
            
            ForEach(buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                               label: {
                            
                            Text(item.rawValue)
                                .font(.system(size: 30))
                                .frame(width: buttonSize(for: item), height: 70)
                                .background(buttonBackgroundColor(for: item))
                                .foregroundColor(.white)
                                .cornerRadius(35)
                        })
                        
                    }
                }
            }
            
        }
        .padding()
    }
}

func buttonBackgroundColor(for item: CalcButton) -> Color {
    switch item.rawValue {
    case "AC":
        return Color.red
    case "C":
        return Color.red
    case "+":
        return Color.gray
    case "-":
        return Color.gray
    case "/":
        return Color.gray
    case "x":
        return Color.gray
    case "=":
        return Color.gray
    case ",":
        return Color.gray
    default:
        return Color.orange
    }
}

func buttonSize(for item: CalcButton) -> Double {
    switch item.rawValue {
    case "0":
        return 150
    default:
        return 70
    }
}
                                   
                                   

#Preview {
    ContentView()
}
