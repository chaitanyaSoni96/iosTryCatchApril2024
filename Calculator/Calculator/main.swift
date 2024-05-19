//
//  main.swift
//  Calculator
//
//  Created by Chaitanya Soni on 06/04/24.
//

import Foundation
import UIKit

print("Calculator")



struct UserInput {
    
    let firstNumber: Double
    let secondNumber: Double
    let operatorString: String
    
    init(firstNumber: Double, secondNumber: Double, operatorString: String) {
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
        self.operatorString = operatorString
    }
}

func getUserInput() -> UserInput {
    print("Please enter your first number: ", terminator: "")
    let firstNumber = Double(readLine() ?? "0") ?? 0
    print("\n")

    print("Please enter your second number: ", terminator: "")
    let secondNumber = Double(readLine() ?? "0") ?? 0
    print("\n")

    print("Please enter the operation to be performed -", terminator: "")
    let operatorString = readLine() ?? ""
    print("\n")
    
    return UserInput.init(firstNumber: firstNumber,
                          secondNumber: secondNumber,
                          operatorString: operatorString)
}

func calculate(firstNumber: Double, secondNumber: Double, operatorString: String) -> Double {
    
    var result: Double = 0
    
    switch operatorString {
    case "+", "plus":
        result = firstNumber + secondNumber
    case "-":
        result = firstNumber - secondNumber
    case "/":
        result = firstNumber / secondNumber
    case "*":
        result = firstNumber * secondNumber
    default: break
    }
    
    return result
}


var shouldContinue: Bool = true

while shouldContinue {
    let userInput = getUserInput()
    let result = calculate(firstNumber: userInput.firstNumber,
                           secondNumber: userInput.secondNumber,
                           operatorString: userInput.operatorString)
    print(result)
    
    print("Do you want to continue? y/n: ", terminator: "")
    let answer = readLine()
    
    shouldContinue = answer?.lowercased() == "y"
}


class VC: UIViewController {
    
    var userInput = ""
    
    func userInputContainsOperator() -> Bool {
        userInput.contains(where: {
            "+-/*".contains($0)
        })
    }
    
    @IBAction func numberTapped(_ sender: UIButton) {
        
        let tag = sender.tag
        userInput.append("\(tag)")
    }
    
    @IBAction func plusTapped() {
        
        if !userInputContainsOperator() {
            userInput.append("+")
        }
    }
    
    @IBAction func equalToTapped() {
        
        if userInputContainsOperator() {
            
            
            if userInput.contains("+") {
                let array = userInput.split(separator: "+")
                if let first = array.first, let second = array.last {
                    
                    let result = Int(first) + Int(second)
                    
                }
            }
            
        }
        
    }
}
