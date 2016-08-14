//
//  ValidAnagrams.swift
//  Test
//
//  Created by Mari Batilando on 8/14/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension String {
    
    func isValidAnagram(withWord word: String) -> Bool {
        var charMap = [Character: Int]()
        
        for char in self.characters {
            if let currCount = charMap[char] {
                charMap[char] = currCount + 1
            } else {
                charMap[char] = 1
            }
        }
        
        for otherChar in word.characters {
            if let currCount = charMap[otherChar] {
                let newCount = currCount - 1
                
                if newCount < 0 {
                    return false
                }
                
                charMap[otherChar] = newCount
            } else {
                return false
            }
        }
        
        for (_, value) in charMap {
            if value != 0 {
                return false
            }
        }
        
        return true
    }
    
}
