//
//  KthSmallestInSortedMatrix.swift
//  Kata
//
//  Created by Mari Batilando on 8/31/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation

/*
Given an n x n matrix, where every row and column is sorted in non-decreasing order. Find the kth smallest element in the given 2D array.

For example, consider the following 2D array.

10, 20, 30, 40
15, 25, 35, 45
24, 29, 37, 48
32, 33, 39, 50
The 3rd smallest element is 20 and 7th smallest element is 30
*/

class MatrixHeapEntry: Comparable {
	var value: Int
	var row: Int
	var column: Int
	
	init(value: Int, row: Int, column: Int) {
		self.value = value
		self.row = row
		self.column = column
	}
}

func ==(lhs: MatrixHeapEntry, rhs: MatrixHeapEntry) -> Bool {
	return lhs.value == rhs.value
}

func <(lhs: MatrixHeapEntry, rhs: MatrixHeapEntry) -> Bool {
	return lhs.value < rhs.value
}

func >(lhs: MatrixHeapEntry, rhs: MatrixHeapEntry) -> Bool {
	return lhs.value > rhs.value
}

func <=(lhs: MatrixHeapEntry, rhs: MatrixHeapEntry) -> Bool {
	return lhs.value <= rhs.value
}

func >=(lhs: MatrixHeapEntry, rhs: MatrixHeapEntry) -> Bool {
	return lhs.value >= rhs.value
}

func kthSmallest(k: Int, matrix: [[Int]]) -> Int {
	let m = matrix.count
	let n = matrix.first!.count
	
	if matrix.isEmpty || matrix.first!.isEmpty || k > m * n {
		return 0
	}
	
	var heap = Heap<MatrixHeapEntry>(ascending: true)
	
	for i in 0..<n {
		let heapEntry = MatrixHeapEntry(value: matrix[0][i], row: 0, column: i)
		heap.push(heapEntry)
	}
	
	//O(logn)
	for _ in 0..<k - 1 {
		let node = heap.peek()!
		let nextVal = node.row < m - 1 ? matrix[node.row + 1][node.column] : Int.max
		node.value = nextVal
		node.row =  node.row + 1
		heap.siftDown(0)
	}
	
	return heap.peek()!.value
}

func kthSmallestTests() {
	let matrix1 = [[10, 20, 30, 40],
	               [15, 25, 35, 45],
	               [24, 29, 37, 48],
	               [32, 33, 39, 50]]
	print("should be 20: \(kthSmallest(k: 3, matrix: matrix1))")
	print("should be 30: \(kthSmallest(k: 7, matrix: matrix1))")
	print("should be 10: \(kthSmallest(k: 1, matrix: matrix1))")
	print("should be 50: \(kthSmallest(k: 16, matrix: matrix1))")
}
