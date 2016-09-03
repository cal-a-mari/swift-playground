//
//  LongestNonRepeatingSubstring.swift
//  Test
//
//  Created by Mari Batilando on 9/3/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Given a string, find the length of the longest substring without repeating characters.
 For example, the longest substring without repeating letters for "abcabcbb" is "abc", which the length is 3.
 For "bbbbb" the longest substring is "b", with the length of 1.
 */
// O(n) runtime & O(n) space
func longestSubstringWithNoRepeatingCharacters(string: String) -> Int {
    var set = Set<Character>()
    var maxCount = 0
    
    for (_, char) in string.characters.enumerated() {
        if !set.contains(char) {
            set.insert(char)
            maxCount = max(maxCount, set.count)
        } else {
            maxCount = max(maxCount, set.count)
            set.removeAll()
        }
    }
    
    return maxCount
}

func longestSubstringWithNoRepeatingCharactersTests() {
    let str1 = "abcabcbb"
    print("Should be 3: \(longestSubstringWithNoRepeatingCharacters(string: str1))")
    
    let str2 = "aa"
    print("Should be 1: \(longestSubstringWithNoRepeatingCharacters(string: str2))")
    
    let str3 = "a"
    print("Should be 1: \(longestSubstringWithNoRepeatingCharacters(string: str3))")
    
    let str4 = ""
    print("Should be 0: \(longestSubstringWithNoRepeatingCharacters(string: str4))")
}
