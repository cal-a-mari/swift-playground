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
    
    // Runtime: O(2^n)
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
    
    // Runtime: O(strA.length * strB.length)
    static func tabularLCS(strA: String, strB: String) -> Int {
        var values = Array(repeatElement(Array(repeatElement(0, count: strB.characters.count + 1)), count: strA.characters.count + 1))
        
        for i in 1...strA.characters.count {
            for j in 1...strB.characters.count {
                let charA = strA[strA.index(strA.startIndex, offsetBy: i - 1)]
                let charB = strB[strB.index(strB.startIndex, offsetBy: j - 1)]
                
                if charA == charB {
                    values[i][j] = values[i - 1][j - 1] + 1
                } else {
                    values[i][j] = max(values[i - 1][j],
                                       values[i][j - 1])
                }
            }
        }
        
        return values[strA.characters.count][strB.characters.count]
    }
    
}


