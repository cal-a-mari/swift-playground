//
//  SearchInRotatedArray.swift
//  Kata
//
//  Created by Mari Batilando on 8/24/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
	
	/*
		Suppose a sorted array is rotated at some pivot unknown to you beforehand. (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
		
		You are given a target value to search. If found in the array return its index, otherwise return -1. You may assume no duplicate exists in the array.
	*/
	// O(logn)
	func rotatedArraySearch(_ target: Element) -> Index? {
		guard let pivotIndex = self.findPivot() else {
			return binarySearch(target, left: self.startIndex, right: self.index(self.endIndex, offsetBy: -1))
		}
		
		if self[pivotIndex] == target {
			return pivotIndex
		}
		
		if self[0] <= target {
			return binarySearch(target, left: self.startIndex, right: self.index(pivotIndex, offsetBy: -1))
		} else {
			return binarySearch(target, left: self.index(pivotIndex, offsetBy: 1), right: self.index(self.endIndex, offsetBy: -1))
		}
	}
	
	private func binarySearch(_ target: Element, left: Index, right: Index) -> Index? {
		var left = left
		var right = right
		
		while left <= right {
			let m = left + (right - left) / 2
			let mid = self.index(self.startIndex, offsetBy: m)
			
			if self[mid] == target {
				return mid
			}
			
			if self[mid] < target {
				left = self.index(mid, offsetBy: 1)
			} else {
				right = self.index(mid, offsetBy: -1)
			}
		}
		
		return nil
	}
	
	private func findPivot() -> Index? {
		var left = self.startIndex
		var right = self.index(self.endIndex, offsetBy: -1)
		
		while left <= right {
			let m = left + (right - left) / 2
			let mid = self.index(self.startIndex, offsetBy: m)
			
			// We check if mid < right to make sure we don't go out of bounds
			if (mid < right) && (self[mid] > self[self.index(mid, offsetBy: 1)]) {
				return mid
			}
			
			if (mid > left) && (self[mid] < self[self.index(mid, offsetBy: -1)]) {
				return self.index(mid, offsetBy: -1)
			}
			
			if self[left] >= self[mid] {
				right = self.index(mid, offsetBy: -1)
			} else {
				left = self.index(mid, offsetBy: 1)
			}
		}
		
		return nil
	}
	
}
