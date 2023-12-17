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
        [.seven, .eight, .nine],
        [.four, .five, .six],
        [.one, .two, .three],]
    
    var body: some View {
        VStack {
            
            //display Text
            HStack {
                Spacer()
                Text("0")
                    .font(.system(size: 52))
                    .bold()
            }
            .padding()
            
            //display Buttons
            
                ForEach(buttons, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { item in
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                                   label: {
                                Text(item.rawValue)
                                    .font(.system(size: 30))
                                    .frame(width: 70, height: 70)
                                    .background(Color.orange)
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

#Preview {
    ContentView()
}
