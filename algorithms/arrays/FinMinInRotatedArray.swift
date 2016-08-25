//
//  FinMinInRotatedArray.swift
//  Kata
//
//  Created by Mari Batilando on 8/25/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation

// O(logn)
func findMin(inRotatedSortedArray array: [Int]) -> Int? {
	if array.isEmpty {
		return nil
	} else if array.count == 1 {
		return array.first!
	}
	
	var left = 0
	var right = array.count - 1
	
	// If not rotated
	if array[left] < array[right] {
		return array[left]
	}
	
	while left <= right {
		if right - left == 1 {
			return array[right]
		}
		
		let mid = left + (right - left) / 2
		
		if array[mid] > array[right] {
			left = mid
		} else {
			right = mid
		}
	}
	
	return array[left]
}

// O(logn)
func findMinRecur(inRotatedSortedArray array: [Int]) -> Int? {
	if array.isEmpty {
		return nil
	} else if array.count == 1 {
		return array.first!
	}
	
	return findMinRecur(array: array, i: 0, j: array.count - 1)
}

private func findMinRecur(array: [Int], i: Int, j: Int) -> Int? {
	if i == j {
		return array[i]
	} else if j - i == 1 {
		return min(array[i], array[j])
	}
	
	if array[i] < array[j] { // If not sorted
		return array[i]
	}
	
	let mid = i + (j - 1) / 2
	
	if array[mid] > array[i] {
		return findMinRecur(array: array, i: mid, j: j)
	}
	
	return findMinRecur(array: array, i: i, j: mid)
}
