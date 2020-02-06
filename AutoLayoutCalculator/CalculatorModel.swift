//
//  CalculatorModel.swift
//  AutoLayoutCalculator
//
//  Created by Viet Anh on 2/6/20.
//  Copyright © 2020 VietAnh. All rights reserved.
//

import Foundation

struct CalculatorModel {
    
    var previousNumber: Double
    var performingMath: Bool
    var operation: String
    
    init() {
        previousNumber = 0
        performingMath = false
        operation = ""
    }
    
    func getResult(currentNumber: Double) -> Double {
        switch operation {
        case "+": return previousNumber + currentNumber
        case "-": return previousNumber - currentNumber
        case "×": return previousNumber * currentNumber
        case "÷": return previousNumber / currentNumber
        case "%": return currentNumber/100
        case "+/-": return -currentNumber
        default: return 0
        }
        
    }
    
}
