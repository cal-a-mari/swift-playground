//
//  Isomorphic.swift
//  Kata
//
//  Created by Mari Batilando on 8/22/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation

/*
 Given two strings s and t, determine if they are isomorphic.
 Two strings are isomorphic if the characters in s can be replaced to get t.
 
 All occurrences of a character must be replaced with another character while
 preserving the order of characters. No two characters may map to the
 same character but a character may map to itself.
 
 For example,"egg" and "add" are isomorphic, "foo" and "bar" are not.
 */
// O(n)
func isIsomorphic(strA: String, strB: String) -> Bool {
    let strA = strA.characters.map { $0 }
    let strB = strB.characters.map { $0 }
    
    var map = [Character: Character]()
    
    if strA.count != strB.count {
        return false
    }
    
    for i in 0..<strB.count {
        if let mappedChar = map[strA[i]] {
            if strB[i] != mappedChar {
                return false
            }
        } else {
            if map.values.contains(strB[i]) {
                return false
            }
            
            map[strA[i]] = strB[i]
        }
    }
    
    return true
}

func isomorphicTests() {
    let str1 = "egg"
    let str2 = "add"
    assert(isIsomorphic(strA: str1, strB: str2))
    
    let str3 = "aab"
    let str4 = "xyz"
    assert(!isIsomorphic(strA: str3, strB: str4))
    
    let str5 = "paper"
    let str6 = "title"
    assert(isIsomorphic(strA: str5, strB: str6))
}
