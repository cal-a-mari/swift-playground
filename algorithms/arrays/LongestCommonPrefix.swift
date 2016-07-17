//
//  LongestCommonPrefix.swift
//  Test
//
//  Created by Mari Batilando on 7/16/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Array {
    
    static func longestCommonPrefix(strings: [String]) -> String {
        guard strings.count > 1 else {
            return strings.first ?? ""
        }
        
        let shortestStr = self.getShortestString(array: strings)
        var longestPrefix = [Character]()
        
        for (index, char) in shortestStr.characters.enumerated() {
            var hasPrefix = true
            
            for str in strings {
                let charIndex = str.characters.index(str.startIndex, offsetBy: index)
                
                if str.characters[charIndex] != char {
                    hasPrefix = false
                    break
                }
            }
            
            if hasPrefix {
                longestPrefix.append(char)
            }
        }
        
        return String(longestPrefix)
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
