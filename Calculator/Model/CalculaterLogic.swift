//
//  CalculaterLogic.swift
//  Calculator
//
//  Created by Fatih on 16.12.2023.
//

import Foundation

struct CalculaterLogic {
    
   private var number: Double?
   private  var intermediateCalculation: (n1: Double, calcMethod: String)?
    mutating func setNumber (_ number: Double) {
        self.number = number
    }
    
    mutating func calculate (symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "AC":
                return n * 0
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
                
            }
        }
        
        return nil
    }
    
    mutating func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "÷":
                return n1 / n2
            case "x":
                return n1 * n2
            default:
                fatalError("")
                
            }
           
            
        }
        return nil
    }
}
