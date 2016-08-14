//
//  GroupAnagrams.swift
//  Test
//
//  Created by Mari Batilando on 8/14/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension String {
    
    static func groupAnagrams(words: [String]) -> [[String]] {
        var map = [String: [String]]()
        
        for word in words {
            let sorted = String(word.characters.sorted())
            
            if var anagrams = map[sorted] {
                anagrams.append(word)
                map[sorted] = anagrams
            } else {
                map[sorted] = [word]
            }
        }
        
        return map.values.flatMap { $0 }
    }
    
}
