//
//  IsPalindrome.swift
//  Test
//
//  Created by Mari Batilando on 8/13/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension String {
    //O(n)
    var isPalindromeRecursion: Bool {
        return type(of: self).isPalindromeRecursion(str: self, i: self.startIndex, j: self.index(self.endIndex, offsetBy: -1))
    }
    
    private static func isPalindromeRecursion(str: String, i: Index, j: Index) -> Bool {
        if i >= j {
            return true
        }
        
        let isPalindrome = str[i] == str[j]
        
        return isPalindrome && self.isPalindromeRecursion(str: str, i: str.index(i, offsetBy: 1), j: str.index(j, offsetBy: -1))
    }
    
    var isPalindromeIterative: Bool {
        guard self.characters.count > 1 else {
            return true
        }
        
        var i = self.startIndex
        var j = self.index(self.endIndex, offsetBy: -1)
        
        while i <= j {
            if self[i] != self[j] {
                return false
            }
            
            i = self.index(i, offsetBy: 1)
            j = self.index(j, offsetBy: -1)
        }
        
        return true
    }
    
    
    
}
