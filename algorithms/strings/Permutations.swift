//
//  Permutations.swift
//  Test
//
//  Created by Mari Batilando on 7/16/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension String {
    var permutations: [String] {
        return self.permutations(string: self)
    }
    
    private func permutations(string: String) -> [String] {
        var countMap = [Character: Int]()
        
        for char in string.characters {
            let currCount = countMap[char] ?? 0
            countMap[char] = currCount + 1
        }
        
        var permutations = [String]()
        
        self.permute(origStr: string, charCount: countMap, result: [Character](), level: 0, permutations: &permutations)
        
        return permutations
    }
    
    private func permute(origStr: String, charCount: [Character: Int], result: [Character], level: Int, permutations: inout [String]) {
        if level == origStr.characters.count {
            permutations.append(String(result))
            return
        }
        
        for (char, count) in charCount {
            if count == 0 {
                continue
            }
            
            var newResult = result
            newResult.insert(char, at: level)
            
            var newCharCount = charCount
            newCharCount[char]! -= 1
            
            self.permute(origStr: origStr, charCount: newCharCount, result: newResult, level: level + 1, permutations: &permutations)
        }
    }

}






