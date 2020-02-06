//
//  ViewController.swift
//  AutoLayoutCalculator
//
//  Created by Viet Anh on 2/6/20.
//  Copyright © 2020 VietAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Model
    private var calculator = CalculatorModel()
    
    //MARK: View
    @IBOutlet private var operationsButton: [UIButton]!
    
    @IBOutlet private weak var displayLabel: UILabel!
    
    private var displayValue: Double { return Double(displayLabel.text!)! }
    
    // MARK: Control
    @IBAction private func tapDigitButton(_ sender: UIButton) {
        setOperationsButton()
        
        let digit = sender.currentTitle!
        
        if displayLabel.text! == "0" || displayLabel.text! == "0.0"{
            displayLabel.text! = ""
        }
        
        if digit == "." && displayLabel.text!.contains(".") {
            return
        }
        
        if calculator.performingMath {
            displayLabel.text = digit
            calculator.performingMath = false
        } else {
            displayLabel.text! += digit
        }
    }
    
    @IBAction private func tapOperationButton(_ sender: UIButton) {
        if sender.currentTitle == "="{
            let result = calculator.getResult(currentNumber: displayValue)
            displayLabel.text! = String(result)
            
        } else if sender.currentTitle == "%" || sender.currentTitle == "+/-" {
            calculator.operation = sender.currentTitle!
            let result = calculator.getResult(currentNumber: displayValue)
            displayLabel.text! = String(result)
            
        } else {
            setTapOperationButton(sender)
            calculator.previousNumber = displayValue
            calculator.operation = sender.currentTitle!
            calculator.performingMath = true
        }
        
    }
    
    @IBAction private func tapAC(_ sender: UIButton) {
        displayLabel.text = "0"
        setOperationsButton()
        calculator.operation = ""
        calculator.performingMath = false
        calculator.previousNumber = 0
    }
    
    private func setOperationsButton() {
        for operationButton in operationsButton {
            operationButton.backgroundColor = .systemOrange
            operationButton.setTitleColor(.white, for: .normal)
        }
    }
    
    private func setTapOperationButton (_ sender: UIButton) {
        if sender.currentTitle == "+/-" || sender.currentTitle == "%" {
            return
        }
        sender.backgroundColor = .white
        sender.setTitleColor(.systemOrange, for: .normal)
    }
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

