//
//  PalindromePairs.swift
//  Test
//
//  Created by Mari Batilando on 8/21/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Given a list of unique words. Find all pairs of distinct indices (i, j) in the given list, so that the concatenation of the two words, i.e. words[i] + words[j] is a palindrome.
 
 Example 1:
 Given words = ["bat", "tab", "cat"]
 Return [[0, 1], [1, 0]]
 The palindromes are ["battab", "tabbat"]
 */
// O(n^2 * m)
func findAllPalindromePairs(words: [String]) -> [(Int, Int)] {
    var pairs = [(Int, Int)]()
    
    for i in 0..<words.count {
        for j in 0..<words.count {
            if j == i {
                continue
            }
            
            let concatenatedWord = words[i] + words[j]

            if concatenatedWord.isPalindromeRecursion {
                pairs.append((i, j))
            }
        }
    }
    
    return pairs
}
