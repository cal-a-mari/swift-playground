//
//  RotateArray.swift
//  Kata
//
//  Created by Mari Batilando on 9/2/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation

/*
Rotate an array of n elements to the right by k steps.

For example, with n = 7 and k = 3, the array [1,2,3,4,5,6,7] is rotated to [5,6,7,1,2,3,4]. How many different ways do you know to solve this problem?
*/
// O(n) runtime and space
func rotate1(array: [Int], by rotation: Int) -> [Int] {
	precondition(rotation > 0)
	
	if array.isEmpty {
		return []
	}
	
	var offset = rotation
	
	if offset > array.count {
		offset = offset % array.count
	}
	
	var res = [Int](repeating: 0, count: array.count)
	
	for j in 0..<offset {
		res[j] = array[array.count - offset + j]
	}
	
	var k = 0
	for i in offset..<array.count {
		res[i] = array[k]
		k += 1
	}
	
	return res
}

// O(m * n) runtime but O(1) space
func rotate2(array: [Int], by rotation: Int) -> [Int] {
	precondition(rotation >= 0, "You cannot rotate by a negative number")
	
	var array = array
	
	for _ in 0..<rotation {
		for j in (1...array.count - 1).reversed() {
			swap(&array[j], &array[j - 1])
		}
	}
	
	return array
}

//O(n) runtime and O(1) space
func rotate3(array: [Int], by rotation: Int) -> [Int] {
	precondition(rotation >= 0, "You cannot rotate by a negative number")
	
	if array.isEmpty {
		return []
	}
	
	var rotation = rotation
	
	if rotation > array.count {
		rotation = rotation % array.count
	}
	
	var array = array
	
	let i = array.count - rotation
	
	reverse(array: &array, start: 0, end: i - 1)
	reverse(array: &array, start: i, end: array.count - 1)
	reverse(array: &array, start: 0, end: array.count - 1)
	
	return array
}

private func reverse(array: inout [Int], start: Int, end: Int) {
	if start == end {
		return
	}
	
	var start = start
	var end = end
	
	while start < end {
		swap(&array[start], &array[end])
		start += 1
		end -= 1
	}
}

func rotate1Tests() {
	let arr1 = [1, 2, 3, 4, 5, 6, 7]
	print("Should be [5, 6, 7, 1, 2, 3, 4]: \(rotate1(array: arr1, by: 3))")
	
	let arr2 = [Int]()
	print("Should be []: \(rotate1(array: arr2, by: 3))")
	
	let arr3 = [1, 2, 3, 4, 5, 6, 7]
	print("Should be [7, 1, 2, 3, 4, 5, 6]: \(rotate1(array: arr3, by: 1))")
	
	let arr4 = [1, 2, 3, 4, 5, 6, 7]
	print("Should be [1, 2, 3, 4, 5, 6, 7]: \(rotate1(array: arr4, by: 0))")
}

func rotate2Tests() {
	let arr1 = [1, 2, 3, 4, 5, 6, 7]
	print("Should be [5, 6, 7, 1, 2, 3, 4]: \(rotate2(array: arr1, by: 3))")
	
	let arr2 = [Int]()
	print("Should be []: \(rotate1(array: arr2, by: 3))")
	
	let arr3 = [1, 2, 3, 4, 5, 6, 7]
	print("Should be [7, 1, 2, 3, 4, 5, 6]: \(rotate2(array: arr3, by: 1))")
	
	let arr4 = [1, 2, 3, 4, 5, 6, 7]
	print("Should be [1, 2, 3, 4, 5, 6, 7]: \(rotate2(array: arr4, by: 0))")
}

func rotate3Tests() {
	let arr1 = [1, 2, 3, 4, 5, 6, 7]
	print("Should be [5, 6, 7, 1, 2, 3, 4]: \(rotate3(array: arr1, by: 3))")
	
	let arr2 = [Int]()
	print("Should be []: \(rotate1(array: arr2, by: 3))")
	
	let arr3 = [1, 2, 3, 4, 5, 6, 7]
	print("Should be [7, 1, 2, 3, 4, 5, 6]: \(rotate3(array: arr3, by: 1))")
	
	let arr4 = [1, 2, 3, 4, 5, 6, 7]
	print("Should be [1, 2, 3, 4, 5, 6, 7]: \(rotate3(array: arr4, by: 0))")
}
