//
//  SymbolMatch.swift
//  Test
//
//  Created by Mari Batilando on 10/1/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

private let openSymbols = Set([Character("("), Character("["), Character("{")])
private let symbolsMap = [Character("("): Character(")"),
                          Character("["): Character("]"),
                          Character("{"): Character("}")]

private extension Character {
    var isOpeningSymbol: Bool {
        return openSymbols.contains(self)
    }
}

func symbolMatch(str: String) -> Bool {
    var stack = Stack<Character>()
    
    for (_, char) in str.characters.enumerated() {
        if char.isOpeningSymbol {
            stack.push(element: char)
        } else {
            if stack.isEmpty {
                return false
            }
            
            if symbolsMap[stack.peek!]! == char {
                let _ = stack.pop()
            } else {
                return false
            }
        }
    }
    
    return stack.isEmpty
}

func symbolMatchTests() {
    let str1 = "()"
    let res1 = true
    let actualRes1 = symbolMatch(str: str1)
    assert(res1 == actualRes1)
    
    let str2 = "({})"
    let res2 = true
    let actualRes2 = symbolMatch(str: str2)
    assert(res2 == actualRes2)
    
    let str3 = "{(]"
    let res3 = false
    let actualRes3 = symbolMatch(str: str3)
    assert(res3 == actualRes3)
    
    let str4 = "()]"
    let res4 = false
    let actualRes4 = symbolMatch(str: str4)
    assert(res4 == actualRes4)
    
    print("Done")
}
