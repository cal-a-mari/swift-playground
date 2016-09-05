//
//  AllPossibleSubstrings.swift
//  Test
//
//  Created by Mari Batilando on 9/5/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

// O(n^2)
func allPossibleSubstrings(string: String) -> [String] {
    let chars = string.characters.map { $0 }
    var res = [String]()
    
    for i in 0..<chars.count {
        res.append(String(chars[i]))
        
        for j in i + 1..<chars.count {
            res.append(String(chars[i...j]))
        }
    }
    
    return res
}

func allPossibleSubstringTests() {
    let str1 = "dog"
    print("Should be [d, do, dog, o, og, g]: \(allPossibleSubstrings(string: str1))")
    
    let str2 = "a"
    print("Should be [a]: \(allPossibleSubstrings(string: str2))")
    
    let str3 = "baa"
    print("Should be [b, ba, baa, a, aa, a]: \(allPossibleSubstrings(string: str3))")
}
