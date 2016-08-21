//
//  LongestValidParentheses.swift
//  Test
//
//  Created by Mari Batilando on 8/21/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension String {
    //O(n)
    var longestValidParentheses: Int {
        var stack = Stack<Character>()
        var count = 0
        var maxCount = 0
        
        for character in self.characters {
            if character == Character(")") && stack.isEmpty {
                count = 0
            } else if character == Character(")") {
                count += 2
                maxCount = max(count, maxCount)
                let _ = stack.pop()
            } else if character == Character("(") {
                stack.push(element: Character("("))
            }
        }
        
        return maxCount
    }
    
}
