//
//  RearrangePalindrome.swift
//  Test
//
//  Created by Mari Batilando on 9/18/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

// O(n^2)
func canFormPalindrome(string: String) -> Bool {
    if string.isEmpty {
        return false
    }
    
    let string = string.characters.map { $0 }
    var oddCount = 0
    
    for i in 0..<string.count - 1 {
        var charCount = 0
        
        for j in i + 1..<string.count {
            if string[j] == string[i] {
                charCount += 1
            }
        }
        
        if charCount % 2 != 0 {
            oddCount += 1
            
            if oddCount > 1 {
                return false
            }
        }
    }
    
    return true
}

// O(n)
func optCanFormPalindrome(string: String) -> Bool {
    if string.isEmpty {
        return false
    }
    
    let alphabetCount = Int(UnicodeScalar("z").value)
    var countArray = [Int](repeating: 0, count: alphabetCount + 1)
    
    for char in string.characters {
        let charValue = String(char).unicodeScalars.first!.value
        countArray[Int(charValue)] += 1
    }
    
    var oddCount = 0
    
    for count in countArray {
        if count % 2 != 0 {
            oddCount += 1
        }
    }
    
    return oddCount <= 1
}

func canFormPalindromeTests() {
    let str1 = "geeksforgeeks"
    let res1 = false
    let actualRes1 = optCanFormPalindrome(string: str1)
    assert(res1 == actualRes1)
    
    let str2 = "geeksogeeks"
    let res2 = true
    let actualRes2 = optCanFormPalindrome(string: str2)
    assert(res2 == actualRes2)
    
    let str3 = "z"
    let res3 = true
    let actualRes3 = optCanFormPalindrome(string: str3)
    assert(res3 == actualRes3)
    
    let str4 = "go"
    let res4 = false
    let actualRes4 = optCanFormPalindrome(string: str4)
    assert(res4 == actualRes4)
}
