//
//  SortedMatrixSearch.swift
//  Test
//
//  Created by Mari Batilando on 8/14/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

// Runtime: O(m + n)
func search(element: Int, inSortedMatrix matrix: [[Int]]) -> Bool {
    guard (matrix.count > 0) && (matrix.first?.count) > 0 else {
        return false
    }
    
    var y = 0
    var x = matrix.first!.count - 1
    
    while (y < matrix.count) && (x >= 0) {
        let currElem = matrix[y][x]
        
        if currElem == element {
            return true
        } else if currElem < element {
            y += 1
        } else {
            x -= 1
        }
    }
    
    return false
}

//O(logn)
func binarySearch(element: Int, inSortedMatrix matrix: [[Int]]) -> Bool {
	guard matrix.count > 0 && matrix.first!.count > 0 else {
		return false
	}
	
	let m = matrix.count
	let n = matrix.first!.count
	
	var start = 0
	var end = m * n - 1
	
	while start <= end {
		let mid = (start + end) / 2
		let i = mid / n
		let j = mid % n
		
		if matrix[i][j] == element {
			return true
		} else if matrix[i][j] < element {
			start = mid + 1
		} else {
			end = mid - 1
		}
	}
	
	return false
}
