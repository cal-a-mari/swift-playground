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
    
    static func tabularEditDistance(strA: String, strB: String) -> Int {
        var distances = Array(repeating: Array(repeatElement(0, count: strB.characters.count)), count: strA.characters.count)
        
        for (i, charA) in strA.characters.enumerated() {
            for (j, charB) in strB.characters.enumerated() {
                if i == 0 {
                    distances[i][j] = j
                } else if j == 0 {
                    distances[i][j] = i
                } else if charA == charB {
                    distances[i][j] = distances[i - 1][j - 1]
                } else {
                    let insertDist = distances[i][j - 1]
                    let removeDist = distances[i - 1][j]
                    let replaceDist = distances[i - 1][j - 1]
                    
                    distances[i][j] = 1 + min(insertDist, removeDist, replaceDist)
                }
            }
        }
        
        return distances[strA.characters.count - 1][strB.characters.count - 1]
    }
    
}
