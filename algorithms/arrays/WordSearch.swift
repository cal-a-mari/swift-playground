//
//  WordSearch.swift
//  Test
//
//  Created by Mari Batilando on 8/20/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func search(forWord word: String, inMatrix matrix: [[Character]]) -> Bool {
    return search(forWord: word, inMatrix: matrix, i: 0, j: 0, charIndex: 0)
}

// O(4^n)
private func search(forWord word: String, inMatrix matrix: [[Character]], i: Int, j: Int, charIndex: Int) -> Bool {
    let m = matrix.count
    let n = matrix.first!.count
    
    guard (i >= 0) && (j >= 0) && (i < m) && (j < n) else {
        return false
    }
    
    if charIndex == word.characters.count {
        return true
    }
    
    let charToSearchFor = word.characters[word.index(word.startIndex, offsetBy: charIndex)]
    
    if matrix[i][j] != charToSearchFor {
        return false
    }
    
    let up = search(forWord: word, inMatrix: matrix, i: i - 1, j: j, charIndex: charIndex + 1)
    let down = search(forWord: word, inMatrix: matrix, i: i + 1, j: j, charIndex: charIndex + 1)
    let left = search(forWord: word, inMatrix: matrix, i: i, j: j - 1, charIndex: charIndex + 1)
    let right = search(forWord: word, inMatrix: matrix, i: i, j: j + 1, charIndex: charIndex + 1)
    
    return up || down || left || right
}
