//
//  Permutations.swift
//  Test
//
//  Created by Mari Batilando on 7/16/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension String {
    var recursivePermutations: [String] {
        var res = [String]()
        var chars = [Character]()
        
        for char in self.characters {
            chars.append(char)
        }
        
        self.dynamicType.permutationsOfString(string: chars, i: 0, results: &res)
        
        return res
    }
    
    static func permutationsOfString(string: [Character], i: Int, results: inout [String]) {
        if i == string.count {
            results.append(String(string))
        } else {
            for k in i..<string.count {
                var string = string
                
                if k != i {
                    swap(&string[i], &string[k])
                }
                
                self.permutationsOfString(string: string, i: i + 1, results: &results)
            }
        }
    }
    
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

func runPermutationTests() {
    let str1 = "ABC"
    print("Should be: [ABC, ACB, BAC, BCA, CBA, CAB]: \(str1.recursivePermutations)")
    print("Should be: [CBA, CAB, BCA, BAC, ACB, ABC]: \(str1.permutations)")
}






