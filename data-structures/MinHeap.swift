//
//  Heap.swift
//  Kata
//
//  Created by Mari Batilando on 8/19/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation

final class MinHeap<T where T: Comparable> {
	
	private var array = [T]()
	
	var count: Int {
		return self.array.count
	}
	
	func push(_ element: T) {
		self.array.append(element)
		
		self.siftUp()
	}
	
	func pop() -> T? {
		guard self.array.count > 0 else {
			return nil
		}
		
		let element = self.array.remove(at: 0)
		
		if self.array.count > 1 {
			swap(&self.array[0], &self.array[self.array.count - 1])
			self.siftDown()
		}
		
		return element
	}
	
	private func siftUp() {
		var childIndex = self.count - 1
		var parentIndex = 0
		
		if childIndex != 0 {
			parentIndex = (childIndex - 1) / 2
		}
		
		while childIndex != 0 {
			let childToUse = self.array[childIndex]
			let parentToUse = self.array[parentIndex]
			
			if childToUse < parentToUse {
				swap(&self.array[childIndex], &self.array[parentIndex])
			}
			
			childIndex = parentIndex
			
			if childIndex != 0 {
				parentIndex = (childIndex - 1) / 2
			}
		}
	}
	
	private func siftDown() {
		
	}
	
}

extension MinHeap: CustomStringConvertible {
	
	var description: String {
		return String(self.array)
	}
	
}
