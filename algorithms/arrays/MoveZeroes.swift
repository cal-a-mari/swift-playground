//
//  MoveZeroes.swift
//  Kata
//
//  Created by Mari Batilando on 8/23/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation

/*
	Given an array of nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

	For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
*/
// O(n)
func moveZeroes(array: inout [Int]) {
	var i = 0
	
	for j in 0..<array.count {
		if array[j] == 0 {
			continue
		} else {
			array[i] = array[j]
			i += 1
		}
	}
	
	while i < array.count {
		array[i] = 0
		i += 1
	}
}
