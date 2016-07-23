//
//  LongestCommonSubsequence.swift
//  Test
//
//  Created by Mari Batilando on 7/23/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension String {
    
    static func lengthofLongestCommonSubsequence(stringA: String, stringB: String) -> Int {
        let res = self.lengthofLongestCommonSubsequence(strA: stringA,
                                                        indexA: stringA.characters.count - 1,
                                                        strB: stringB,
                                                        indexB: stringB.characters.count - 1)
        return res
    }
    
    private static func lengthofLongestCommonSubsequence(strA: String, indexA: Int, strB: String, indexB: Int) -> Int {
        guard (indexA >= 0) && (indexB >= 0) else {
            return 0
        }
        
        let charAIndex = strA.index(strA.startIndex, offsetBy: indexA)
        let charA = strA.characters[charAIndex]
        
        let charBIndex = strB.index(strB.startIndex, offsetBy: indexB)
        let charB = strB.characters[charBIndex]
        
        if charA == charB {
            return 1 + self.lengthofLongestCommonSubsequence(strA: strA, indexA: indexA - 1, strB: strB, indexB: indexB - 1)
        } else {
            let removeCharA = self.lengthofLongestCommonSubsequence(strA: strA, indexA: indexA - 1, strB: strB, indexB: indexB)
            let removeCharB = self.lengthofLongestCommonSubsequence(strA: strA, indexA: indexA, strB: strB, indexB: indexB - 1)
            return max(removeCharA, removeCharB)
        }
    }
    
    static func tabularLCS(strA: String, strB: String) -> Int {
        var table = Array(repeating: Array(repeatElement(0, count: strB.characters.count + 1)), count: strA.characters.count + 1)
        
        // table[i][j] contains length of LCS of X[0..i-1] and Y[0..j-1]
        for (i, charA) in strA.characters.enumerated() {
            for (j, charB) in strB.characters.enumerated() {
                if charA == charB {
                    table[i + 1][j + 1] = table[i][j] + 1
                } else {
                    table[i + 1][j + 1] = max(table[i][j + 1], table[i + 1][j])
                }
            }
            
        }
        
        return table[strA.characters.count][strB.characters.count]
    }
    
}
