//
//  SudokuChecker.swift
//  Test
//
//  Created by Mari Batilando on 10/1/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

// O(n^2) runtime and O(n) space
func sudokuChecker(board: [[Int]]) -> Bool {
    let n = board.count
    var set = Set<Int>()
    
    for i in 0..<n {
        for j in 0..<n {
            if set.contains(board[i][j]) && board[i][j] != 0 {
                return false
            } else {
                set.insert(board[i][j])
            }
        }
        
        set.removeAll()
    }
    
    for j in 0..<n {
        for i in 0..<n {
            if set.contains(board[i][j]) && board[i][j] != 0 {
                return false
            } else {
                set.insert(board[i][j])
            }
        }
        
        set.removeAll()
    }
    
    for i in stride(from: 0, to: n, by: 3) {
        for j in stride(from: 0, to: n, by: 3) {
            for k in i..<i + 3 {
                for l in j..<j + 3 {
                    if set.contains(board[k][l]) && board[k][l] != 0 {
                        return false
                    } else {
                        set.insert(board[k][l])
                    }
                }
            }
            
            set.removeAll()
        }
        
    }
    
    return true
}

func sudokuTests() {
    let board1 = [[5, 3, 0, 0, 7, 0, 0, 0, 0],
                  [6, 0, 0, 1, 9, 5, 0, 0, 0],
                  [0, 9, 8, 0, 0, 0, 0, 6, 0],
                  [8, 0, 0, 0, 6, 0, 0, 0, 3],
                  [4, 0, 0, 8, 0, 3, 0, 0, 1],
                  [7, 0, 0, 0, 2, 0, 0, 0, 6],
                  [0, 6, 0, 0, 0, 0, 2, 8, 0],
                  [0, 0, 0, 4, 1, 9, 0, 0, 5],
                  [0, 0, 0, 0, 8, 0, 0, 7, 9]]
    let res1 = true
    let actualRes1 = sudokuChecker(board: board1)
    assert(res1 == actualRes1)
    
    let board2 = [[5, 3, 0, 0, 7, 0, 0, 0, 0],
                  [6, 0, 0, 1, 9, 5, 0, 0, 0],
                  [0, 5, 8, 0, 0, 0, 0, 6, 0],
                  [8, 0, 0, 0, 6, 0, 0, 0, 3],
                  [4, 0, 0, 8, 0, 3, 0, 0, 1],
                  [7, 0, 0, 0, 2, 0, 0, 0, 6],
                  [0, 6, 0, 0, 0, 0, 2, 8, 0],
                  [0, 0, 0, 4, 1, 9, 0, 0, 5],
                  [0, 0, 0, 0, 8, 0, 0, 7, 9]]
    let res2 = false
    let actualRes2 = sudokuChecker(board: board2)
    assert(res2 == actualRes2)
    
    let board3 = [[5, 3, 0, 0, 7, 0, 0, 0, 0],
                  [6, 0, 0, 1, 9, 6, 0, 0, 0],
                  [0, 9, 8, 0, 0, 0, 0, 6, 0],
                  [8, 0, 0, 0, 6, 0, 0, 0, 3],
                  [4, 0, 0, 8, 0, 3, 0, 0, 1],
                  [7, 0, 0, 0, 2, 0, 0, 0, 6],
                  [0, 6, 0, 0, 0, 0, 2, 8, 0],
                  [0, 0, 0, 4, 1, 9, 0, 0, 5],
                  [0, 0, 0, 0, 8, 0, 0, 7, 9]]
    let res3 = false
    let actualRes3 = sudokuChecker(board: board3)
    assert(res3 == actualRes3)
    
    print("Done")
}











