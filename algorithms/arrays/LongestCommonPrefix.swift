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
        
        var chars = [Character]()
        var shortestStr = strings.min()!
        
        for (i, char) in shortestStr.characters.enumerated() {
            for str in strings {
                let charIndex = str.characters.index(str.characters.startIndex, offsetBy: i)
                if str[charIndex] != char {
                    return String(chars)
                }
            }
            
            chars.append(char)
        }
        
        return String(chars)
    }
    
}
