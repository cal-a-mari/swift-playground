//
//  Interleave.swift
//  Test
//
//  Created by Mari Batilando on 10/2/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

// O(2^n)
func interleaving(str: String, isInterleavingOf strA: String, strB: String) -> Bool {
    if str.characters.count != strA.characters.count + strB.characters.count {
        return false
    }
    
    let str = str.characters.map { $0 }
    let strA = strA.characters.map { $0 }
    let strB = strB.characters.map { $0 }
    
    return interleaving(str: str, i: 0, strA: strA, j: 0, strB: strB, k: 0)
}

private func interleaving(str: [Character], i: Int, strA: [Character], j: Int, strB: [Character], k: Int) -> Bool {
    if (i == str.count) && (j == strA.count) && (k == strB.count) {
        return true
    }
    
    if (i == str.count) && ((j < strA.count) || (k < strB.count)) {
        return false
    }
    
    if j < strA.count {
        if str[i] == strA[j] {
            return interleaving(str: str, i: i + 1, strA: strA, j: j + 1, strB: strB, k: k)
        }
    }
    
    if k < strB.count {
        if str[i] == strB[k] {
            return interleaving(str: str, i: i + 1, strA: strA, j: j, strB: strB, k: k + 1)
        }
    }
    
    return false
}

// O(m * n)
func optIsInterleaving(str: String, strA: String, strB: String) -> Bool {
    let str = str.characters.map { $0 }
    let strA = strA.characters.map { $0 }
    let strB = strB.characters.map { $0 }
    
    if str.count != strA.count + strB.count {
        return false
    }
    
    var vals = Array(repeating: Array(repeating: false, count: strB.count + 1), count: strA.count + 1)
    
    for i in 0...strA.count {
        for j in 0...strB.count {
            if i == 0 && j == 0 {
                // 2 Empty Strings
                vals[i][j] = true
            } else if (i == 0) && (strB[j - 1] == str[j - 1]) {
                // If strA is empty
                vals[i][j] = vals[i][j - 1]
            } else if (j == 0) && (strA[i - 1] == str[i - 1]) {
                // If strB is empty
                vals[i][j] = vals[i - 1][j]
            } else if (i > 0) && (j > 0) && (strA[i - 1] == str[i + j - 1]) && (strB[j - 1] != str[i + j - 1]) {
                // Curr character in strA matches curr character in str but not strB
                vals[i][j] = vals[i - 1][j]
            } else if (i > 0) && (j > 0) && (strA[i - 1] != str[i + j - 1]) && (strB[j - 1] == str[i + j - 1]) {
                // Curr character in strB matches curr character in str but not strA
                vals[i][j] = vals[i][j - 1]
            } else if (i > 0) && (j > 0) && (strA[i - 1] == str[i + j - 1]) && (strB[j - 1] == str[i + j - 1]) {
                // Curr character in both strA and strB matches curr character in str
                vals[i][j] = vals[i - 1][j] || vals[i][j - 1]
            }
        }
    }
    
    return vals[strA.count][strB.count]
}

func interleavingTests() {
    let str1 = "ab"
    let str2 = "cd"
    let str3 = "acbd"
    let res1 = true
    let actualRes1 = optIsInterleaving(str: str3, strA: str1, strB: str2)
    assert(res1 == actualRes1)
    
    let str4 = "aadbbbaccc"
    let res2 = false
    let actualRes2 = optIsInterleaving(str: str4, strA: str1, strB: str2)
    assert(res2 == actualRes2)
    
    print("Done")
}
