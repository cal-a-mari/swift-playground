//
//  Candy.swift
//  Test
//
//  Created by Mari Batilando on 8/30/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 There are N children standing in a line. Each child is assigned a rating value. You are giving candies to these children subjected to the following requirements:
 
 1. Each child must have at least one candy.
 2. Children with a higher rating get more candies than their neighbors.
 
 What is the minimum candies you must give?
 */
// O(n)
func candy(grades: [Int]) -> Int {
    if grades.isEmpty {
        return 0
    }
    
    var candies = [Int](repeating: 0, count: grades.count)
    candies[0] = 1
    
    for i in 1..<grades.count {
        if grades[i] == grades[i - 1] {
            candies[i] = candies[i - 1]
        } else if grades[i] > grades[i - 1] {
            candies[i] = candies[i - 1] + 1
        } else {
            candies[i] = 1
        }
    }
    
    for j in (0...grades.count - 2).reversed() {
        if grades[j] == grades[j + 1] {
            candies[j] = candies[j + 1]
        } else if grades[j] > grades[j + 1] && candies[j] <= candies[j + 1] {
            candies[j] = candies[j + 1] + 1
        }
    }
    
    return candies.reduce(0) { $0 + $1 }
}

func candyTests() {
    let grades1 = [1, 2, 3]
    print(candy(grades: grades1))
    
    let grades2 = [3, 2, 1]
    print(candy(grades: grades2))
    
    let grades3 = [1, 2, 2, 3]
    print(candy(grades: grades3))
    
    let grades4 = [1, 1, 1]
    print(candy(grades: grades4))
    
    let grades5 = [1, 2, 2, 1, 0]
    print(candy(grades: grades5))
    
    let grades = [Int]()
    print(candy(grades: grades))
}
