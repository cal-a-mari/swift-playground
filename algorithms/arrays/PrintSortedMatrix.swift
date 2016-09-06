//
//  PrintSortedMatrix.swift
//  Kata
//
//  Created by Mari Batilando on 9/6/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation

/*
	Given an n x n matrix, where every row and column is sorted in non-decreasing order. Print all elements of matrix in sorted order.

Input:
{{10, 20, 30, 40},

{15, 25, 35, 45},

{27, 29, 37, 48},

{32, 33, 39, 50}};

Output:

Elements of matrix in sorted order

10 15 20 25 27 29 30 32 33 35 37 39 40 45 48 50

*/
struct MatrixHeapNode: Comparable, Equatable {
	let value: Int
	let row: Int
	let column: Int
}

func ==(lhs: MatrixHeapNode, rhs: MatrixHeapNode) -> Bool {
	return lhs.value == rhs.value
}

func <(lhs: MatrixHeapNode, rhs: MatrixHeapNode) -> Bool {
	return lhs.value < rhs.value
}

func >(lhs: MatrixHeapNode, rhs: MatrixHeapNode) -> Bool {
	return lhs.value > rhs.value
}

func <=(lhs: MatrixHeapNode, rhs: MatrixHeapNode) -> Bool {
	return lhs.value <= rhs.value
}

func >=(lhs: MatrixHeapNode, rhs: MatrixHeapNode) -> Bool {
	return lhs.value >= rhs.value
}


func printSortedMatrix(matrix: [[Int]]) -> [Int] {
	if matrix.isEmpty {
		return []
	}
	
	if matrix.first!.isEmpty {
		return []
	}
	
	var heap = Heap<MatrixHeapNode>(ascending: true, elements: [])
	var res = [Int]()
	let m = matrix.count
	let n = matrix.first!.count
	
	for j in 0..<n {
		let heapNode = MatrixHeapNode(value: matrix[0][j], row: 0, column: j)
		heap.push(heapNode)
	}
	
	while !heap.isEmpty {
		let popped = heap.pop()!
		res.append(popped.value)
		
		if popped.row < m - 1{
			let nextVal = matrix[popped.row + 1][popped.column]
			let newNode = MatrixHeapNode(value: nextVal, row: popped.row + 1, column: popped.column)
			heap.push(newNode)
		}
	}
	
	return res
}

func printSortedMatrixTests() {
	let matrix1 = [[10, 20, 30, 40],
	               [15, 25, 35, 45],
	               [27, 29, 37, 48],
	               [32, 33, 39, 50]]
	let res1 = printSortedMatrix(matrix: matrix1)
	let correctRes1 = [10, 15, 20, 25, 27, 29, 30, 32, 33, 35, 37, 39, 40, 45, 48, 50]
	print("Test 1 Success: \(correctRes1 == res1)")
	
	let matrix2 = [[10, 20, 30, 40],
	               [15, 25, 35, 45],
	               [27, 29, 37, 48]]
	let res2 = printSortedMatrix(matrix: matrix2)
	let correctRes2 = [10, 15, 20, 25, 27, 29, 30, 35, 37, 40, 45, 48]
	print("Test 2 Success: \(correctRes2 == res2)")
}
