//
//  ReversePolishNotation.swift
//  Test
//
//  Created by Mari Batilando on 8/21/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Evaluate the value of an arithmetic expression in Reverse Polish Notation. Valid operators are +, -, *, /. Each operand may be an integer or another expression. For example:
 
 ["2", "1", "+", "3", "*"] -> ((2 + 1) * 3) -> 9
 ["4", "13", "5", "/", "+"] -> (4 + (13 / 5)) -> 6
 
 */

var operations: Set<String> = {
    var operations = Set<String>()
    operations.insert("+")
    operations.insert("-")
    operations.insert("*")
    operations.insert("/")
    return operations
}()

//O(n)
func evaluateReversePolishNotation(expression: [String]) -> Int {
    var stack = Stack<String>()
    
    for expr in expression {
        if operations.contains(expr) {
            let operand1 = Int(stack.pop())!
            let operand2 = Int(stack.pop())!
            let result = perform(operation: expr, operand1: operand1, operand2: operand2)
            stack.push(element: String(result))
        } else {
            stack.push(element: expr)
        }
    }
    
    return Int(stack.pop())!
}

private func perform(operation: String, operand1: Int, operand2: Int) -> Int {
    switch operation {
        case "+":
            return operand1 + operand2
        case "-":
            return operand1 - operand2
        case "*":
            return operand1 * operand2
        case "/":
            return operand2 / operand1
        default:
            fatalError()
    }
}
