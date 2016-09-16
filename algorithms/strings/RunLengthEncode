//
//  RunLengthEncoding.swift
//  Kata
//
//  Created by Mari Batilando on 9/16/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation

// O(n) runtime and space
func runLengthEncode(_ string: String) -> String {
	if string.isEmpty {
		return ""
	}
	
	var encoded = ""
	var currCount = 0
	var currChar = string.characters.first!
	
	for char in string.characters {
		if char != currChar {
			encoded += "\(currChar)\(currCount)"
			currChar = char
			currCount = 1
		} else {
			currCount += 1
		}
	}
	
	encoded += "\(currChar)\(currCount)" // For the last element
	
	return encoded
}

func runLengthEncodeTests() {
	let str1 = "aaabbc"
	let res1 = "a3b2c1"
	let actualRes1 = runLengthEncode(str1)
	assert(res1 == actualRes1)
	
	let str2 = "abc"
	let res2 = "a1b1c1"
	let actualRes2 = runLengthEncode(str2)
	assert(res2 == actualRes2)
	
	let str3 = ""
	let res3 = ""
	let actualRes3 = runLengthEncode(str3)
	assert(res3 == actualRes3)
	
	let str4 = "ababa"
	let res4 = "a1b1a1b1a1"
	let actualRes4 = runLengthEncode(str4)
	assert(res4 == actualRes4)
}
