//
//  SortStack.swift
//  Kata
//
//  Created by Mari Batilando on 9/19/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation

/*
	is_empty(S)  : Tests whether stack is empty or not.
	push(S)	     : Adds new element to the stack.
	pop(S)	     : Removes top element from the stack.
	top(S)	     : Returns value of the top element. Note that this
	function does not remove element from the stack.
*/

extension Stack where T: Comparable {
	
	mutating func sort() {
		if !self.isEmpty {
			let pop = self.pop()
			self.sort()
			sortedInsert(value: pop)
		}
	}
	
	private mutating func sortedInsert(value: T) {
		if self.isEmpty || value > self.peek! {
			self.push(value)
			return
		}
		
		let temp = self.pop()
		sortedInsert(value: value)
		self.push(temp)
	}
	
}

func sortedInsertTests() {
	var stack1 = Stack<Int>()
	stack1.push(3)
	stack1.push(2)
	stack1.push(1)
	let res1 = [3, 2, 1]
	var actualRes1 = [Int]()
	stack1.sort()
	
	while !stack1.isEmpty {
		actualRes1.append(stack1.pop())
	}
	
	assert(actualRes1 == res1)
}
