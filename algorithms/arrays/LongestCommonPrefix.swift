//
//  LongestCommonPrefix.swift
//  Test
//
//  Created by Mari Batilando on 7/16/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Array {
    
    static func longestCommonPrefix(array: [String]) -> String {
        guard array.count > 1 else {
            return array.first ?? ""
        }
        // O(length of array)
        var shortestString = self.getShortestString(array: array)
        var substr = ""
        // O(length of shortest string)
        for i in 0..<shortestString.characters.count {
            let charIndex = shortestString.index(shortestString.startIndex, offsetBy: i)
            let char = shortestString[charIndex]
            // O(length of array)
            for str in array {
                if str[charIndex] != char {
                    return substr
                }
            }
            
            substr += String(shortestString[charIndex])
        }
        
        return substr
    }
    
    static func getShortestString(array: [String]) -> String {
        var shortestString = array.first
        
        for str in array {
            if str.characters.count < shortestString?.characters.count {
                shortestString = str
            }
        }
        
        return shortestString ?? ""
    }
    
}
