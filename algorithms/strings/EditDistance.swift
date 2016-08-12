//
//  EditDistance.swift
//  Test
//
//  Created by Mari Batilando on 7/23/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension String {
    
    static func editDistance(stringA: String, stringB: String) -> Int {
        return self.editDistance(strA: stringA, indexA: stringA.characters.count - 1, strB: stringB, indexB: stringB.characters.count - 1)
    }
    
    private static func editDistance(strA: String, indexA: Int, strB: String, indexB: Int) -> Int {
        if indexA == 0 {
            return indexB
        }
        
        if indexB == 0 {
            return indexA
        }
        
        let charAIndex = strA.index(strA.startIndex, offsetBy: indexA)
        let charBIndex = strB.index(strB.startIndex, offsetBy: indexB)
        
        if strA[charAIndex] == strB[charBIndex] {
            return self.editDistance(strA: strA, indexA: indexA - 1, strB: strB, indexB: indexB - 1)
        } else {
            let insertDist = self.editDistance(strA: strA, indexA: indexA, strB: strB, indexB: indexB - 1)
            let removeDist = self.editDistance(strA: strA, indexA: indexA - 1, strB: strB, indexB: indexB)
            let replaceDist = self.editDistance(strA: strA, indexA: indexA - 1, strB: strB, indexB: indexB - 1)
            
            return 1 + min(insertDist, removeDist, replaceDist)
        }
    }
    
    static func optEditDistance(strA: String, strB: String) -> Int {
        // values[i][j] contains the edit distance from strA[0...i] and strB[0...j]
        var values = Array(repeatElement(Array(repeatElement(0, count: strB.characters.count + 1)), count: strA.characters.count + 1))
        
        // the edit distance for strA[0...i] and an empty strB is i
        for i in 0...strA.characters.count {
            values[i][0] = i
        }
        
        // the edit distance for strB[0...j] and an empty strA is j
        for j in 0...strB.characters.count {
            values[0][j] = j
        }
        
        for i in 1...strA.characters.count {
            let charAIndex = strA.index(strA.startIndex, offsetBy: i - 1)
            let charA = strA[charAIndex]
            
            for j in 1...strB.characters.count {
                let charBIndex = strB.index(strB.startIndex, offsetBy: j - 1)
                let charB = strB[charBIndex]
                
                if charA == charB {
                    values[i][j] = values[i - 1][j - 1]
                } else {
                    let remove = values[i - 1][j]
                    let replace = values[i - 1][j - 1]
                    let insert = values[i][j - 1]
                    values[i][j] = 1 + min(remove, replace, insert)
                }
            }
        }
        
        return values[strA.characters.count][strB.characters.count]
    }
    
}
