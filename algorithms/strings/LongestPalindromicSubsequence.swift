//
//  LongestPalindromicSubsequence.swift
//  Test
//
//  Created by Mari Batilando on 8/6/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension String {
    
    var longestPalindromicSubsequence: Int {
        return self.dynamicType.lpc(string: self, i: self.startIndex, j: self.index(self.endIndex, offsetBy: -1))
    }
    
    private static func lpc(string: String, i: Index, j: Index) -> Int {
        if i == j {
            return 1
        }
        
        // If both chars are the same and there are only two characters
        if (string.characters[i] == string.characters[j]) && (string.index(i, offsetBy: 1) == j) {
            return 2
        } else if string.characters[i] == string.characters[j] {
            return self.lpc(string: string, i: string.index(i, offsetBy: 1), j: string.index(j, offsetBy: -1)) + 2
        }
        
        let substr = self.lpc(string: string, i: i, j: string.index(j, offsetBy: -1))
        let anotherSubstr = self.lpc(string: string, i: string.index(i, offsetBy: 1), j: j)
        return max(substr, anotherSubstr)
    }
    
    var optimizedLongestPalindromicSubsequence: Int {
        return self.dynamicType.lpc(string: self)
    }
    
    private static func lpc(string: String) -> Int {
        var values = Array(repeating: Array(repeating: 1, count: string.characters.count), count: string.characters.count)
        
        for strLen in 2...string.characters.count {
            for i in 0..<(string.characters.count - strLen + 1) {
                let iIndex = string.index(string.startIndex, offsetBy: i)
                let j =  i + strLen - 1
                let jIndex = string.index(string.startIndex, offsetBy: j)
                
                if (string[iIndex] == string[jIndex]) && (strLen == 2) {
                    values[i][j] = 2
                } else if string[iIndex] == string[jIndex] {
                    values[i][j] = values[i + 1][j - 1] + 2
                } else {
                    values[i][j] = max(values[i][j - 1], values[i + 1][j])
                }
            }
        }
        
        return values[0][string.characters.count - 1]
    }
    
}
