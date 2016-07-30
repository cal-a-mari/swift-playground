//
//  NumberWaysCoverDistance.swift
//  Test
//
//  Created by Mari Batilando on 7/30/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

typealias Distance = Int

// Runtime: O(3^distance)
func waysToCover(distance: Distance) -> Int {
    if distance == 0 {
        return 1
    } else if distance < 0 {
        return 0
    }
    
    return waysToCover(distance: distance - 1) + waysToCover(distance: distance - 2) + waysToCover(distance: distance - 3)
}

func memoizedWaysToCover(distance: Distance) -> Int {
    var values = [Distance: Int]()
    return memoizedWaysToCover(distance: distance, values: &values)
}

private func memoizedWaysToCover(distance: Distance, values: inout [Distance: Int]) -> Int {
    if distance == 0 {
        return 1
    } else if distance < 0 {
        return 0
    }
    
    var dist1: Distance
    if let memoizedDist1 = values[distance - 1] {
        dist1 = memoizedDist1
    } else {
        dist1 = memoizedWaysToCover(distance: distance - 1, values: &values)
        values[distance - 1] = dist1
    }
    
    var dist2: Distance
    if let memoizedDist2 = values[distance - 2] {
        dist2 = memoizedDist2
    } else {
        dist2 = memoizedWaysToCover(distance: distance - 2, values: &values)
        values[distance - 2] = dist2
    }
    
    var dist3: Distance
    if let memoizedDist3 = values[distance - 3] {
        dist3 = memoizedDist3
    } else {
        dist3 = memoizedWaysToCover(distance: distance - 3, values: &values)
        values[distance - 3] = dist3
    }
    
    return dist1 + dist2 + dist3
}

// Runtime: O(distance)
func tabularWaysToCover(distance: Distance) -> Int {
    var values = [Distance](repeatElement(0, count: distance + 1))
    values[0] = 0
    values[1] = 1
    values[2] = 2
    
    for i in 3...distance {
        values[i] = values[i - 1] + values[i - 2] + values[i - 3]
    }
    
    return values[distance]
}










