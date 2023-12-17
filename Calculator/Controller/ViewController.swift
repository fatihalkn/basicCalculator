//
//  ViewController.swift
//  Calculator
//
//  Created by Fatih on 16.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var isFinishTypingNumber: Bool = true
    
    private var resultValue: Double {
        get {
            guard let number = Double(resultLabel.text!) else {
                fatalError("")
            }
            return number
            
        }
        set {
            resultLabel.text = String(newValue)
        }
    }
        
    private var calculator = CalculaterLogic()

    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func calcButtonTap(_ sender: UIButton) {
        isFinishTypingNumber = true
        calculator.setNumber(resultValue)
        
        if let calcMethod = sender.titleLabel?.text {
            if let result = calculator.calculate(symbol: calcMethod) {
                resultValue = result

            }
            
        }
       
        
    }
    
    @IBAction func numberButtınTap(_ sender: UIButton) {
        if let numValue = sender.titleLabel?.text {
            if isFinishTypingNumber {
                resultLabel.text = numValue
                isFinishTypingNumber = false
            } else {
                if numValue == "." {
                    guard  let currentDisplayValue = Double(resultLabel.text!) else {
                        fatalError("")
                    }
                    
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    if !isInt {
                        return
                    }
                }
                
                resultLabel.text = resultLabel.text! + numValue
            }
        }
    }
}

