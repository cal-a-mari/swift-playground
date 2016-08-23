//
//  MatrixSetZeroes.swift
//  Kata
//
//  Created by Mari Batilando on 8/23/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation

/*
	Given a m * n matrix, if an element is 0, set its entire row and column to 0.
*/
// O(mn) Runtime
// O(m + n) Space
func setZeroes(matrix: inout [[Int]]) {
	let m = matrix.count
	let n = matrix.first!.count
	
	var rows = Array(repeatElement(false, count: m))
	var cols = Array(repeatElement(false, count: n))
	
	for i in 0..<m {
		for j in 0..<n {
			if matrix[i][j] == 0 {
				rows[i] = true
				cols[j] = true
			}
		}
	}
	
	for i in 0..<m {
		for j in 0..<n {
			if rows[i] || cols[j] {
				matrix[i][j] = 0
			}
		}
	}
}
//O(mn) + O(1) space
func optSetZeroes(matrix: inout [[Int]]) {
	// Trick: We use the first column and row as the auxiliary arrays and just use flags to remember if we should set them as zeroes
	var rowFlag = false
	var colFlag = false
	
	let m = matrix.count
	let n = matrix.first!.count
	
	for i in 0..<m {
		if matrix[i][0] == 0 {
			colFlag = true
			break
		}
	}
	
	for j in 0..<n {
		if matrix[0][j] == 0 {
			rowFlag = true
			break
		}
	}
	
	for i in 1..<m {
		for j in 1..<n {
			if matrix[i][j] == 0 {
				matrix[0][j] = 0
				matrix[i][0] = 0
			}
		}
	}
	
	for i in 1..<m {
		for j in 1..<n {
			if matrix[0][j] == 0 || matrix[i][0] == 0 {
				matrix[i][j] = 0
			}
		}
	}
	
	if rowFlag {
		for j in 0..<n {
			matrix[0][j] = 0
		}
	}
	
	if colFlag {
		for i in 0..<m {
			matrix[i][0] = 0
		}
	}
	
}
