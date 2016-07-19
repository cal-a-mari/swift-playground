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
        var countMap = [Character: Int]()
        
        for char in self.characters {
            let currCount = countMap[char] ?? 0
            countMap[char] = currCount + 1
        }
        
        var results = [String]()
        self.dynamicType.permutations(ofString: self, currStr: [Character](), countMap: countMap, results: &results)
        return results
    }
    
    static func permutations(ofString string: String, currStr: [Character], countMap: [Character: Int], results: inout [String]) {
        if currStr.count == string.characters.count {
            results.append(String(currStr))
        }
        
        for (key, value) in countMap {
            if value == 0 {
                continue
            }
            
            var newStr = currStr
            newStr.append(key)
            
            var newCount = countMap
            newCount[key]! -= 1
            
            self.permutations(ofString: string, currStr: newStr, countMap: newCount, results: &results)
        }
    }
}






