//
//  PhoneNumbers.swift
//  Kata
//
//  Created by Mari Batilando on 9/16/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation
// O(4^n) because the most characters a digit can have is 4
func words(fromPhoneDigits digits: [Int]) -> [String] {
	let numberMap = [
		0: [],
		1: [],
		2: [Character("a"), Character("b"), Character("c")],
		3: [Character("d"), Character("e"), Character("f")],
		4: [Character("g"), Character("h"), Character("i")],
		5: [Character("j"), Character("k"), Character("l")],
		6: [Character("m"), Character("n"), Character("o")],
		7: [Character("p"), Character("q"), Character("r"), Character("s")],
		8: [Character("t"), Character("u"), Character("v")],
		9: [Character("w"), Character("x"), Character("y"), Character("z")]
	]
	
	var words = [String]()
	wordsHelper(digits: digits, currDigit: 0, currWord: [Character](), words: &words, numberMap: numberMap)
	return words
}

private func wordsHelper(digits: [Int], currDigit: Int, currWord: [Character], words: inout [String], numberMap: [Int: [Character]]) {
	if digits.isEmpty {
		return
	}
	
	if currDigit == digits.count {
		words.append(String(currWord))
		return
	}
	
	for i in 0..<numberMap[digits[currDigit]]!.count {
		var newWord = currWord
		let char = numberMap[digits[currDigit]]![i]
		newWord.append(char)
		wordsHelper(digits: digits, currDigit: currDigit + 1, currWord: newWord, words: &words, numberMap: numberMap)
	}
}

func wordTests() {
	let digits1 = [2, 3]
	let res1 = ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
	let actualRes1 = words(fromPhoneDigits: digits1)
	assert(actualRes1 == res1)
	
	let digits2 = [1, 2]
	let res2 = [String]()
	let actualRes2 = words(fromPhoneDigits: digits2)
	assert(actualRes2 == res2)
	
	let digits3 = [Int]()
	let res3 = [String]()
	let actualRes3 = words(fromPhoneDigits: digits3)
	assert(actualRes3 == res3)
}
