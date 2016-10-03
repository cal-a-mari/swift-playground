//
//  GameScore.swift
//  Test
//
//  Created by Mari Batilando on 10/2/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation
/*
     Consider a game where a player can score 3 or 5 or 10 points in a move. Given a total score n, find number of ways to reach the given score.
 */
// O(3^n)
func numWays(toGetScore score: Int) -> Int {
    if score == 0 {
        return 1
    }
    
    if score < 0 {
        return 0
    }
    
    let a = numWays(toGetScore: score - 3)
    let b = numWays(toGetScore: score - 5)
    let c = numWays(toGetScore: score - 10)
    
    return a + b + c
}

// O(n) runtime and space
func optNumWays(toGetScore score: Int) -> Int {
    var vals = [Int](repeating: 0, count: score + 1)
    vals[0] = 1
    
    for i in 3...score {
        vals[i] += vals[i - 3]
    }
    
    for i in 5...score {
        vals[i] += vals[i - 5]
    }
    
    for i in 10...score {
        vals[i] += vals[i - 10]
    }
    
    return vals[score]
}

func numWaysTests() {
    assert(optNumWays(toGetScore: 20) == 4)
    assert(optNumWays(toGetScore: 13) == 2)
    
    print("Done")
}
