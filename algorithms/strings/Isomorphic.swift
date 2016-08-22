//
//  Isomorphic.swift
//  Kata
//
//  Created by Mari Batilando on 8/22/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation

extension String {
	
	/*
		Given two strings s and t, determine if they are isomorphic.
		Two strings are isomorphic if the characters in s can be replaced to get t.
	
		All occurrences of a character must be replaced with another character while 
		preserving the order of characters. No two characters may map to the
		same character but a character may map to itself.
	
		For example,"egg" and "add" are isomorphic, "foo" and "bar" are not.
	*/
	// O(n)
	func isIsomorphic(withString string: String) -> Bool {
		guard self.characters.count == string.characters.count else {
			return false
		}
		
		var map = [Character: Character]()

		for (i, char) in self.characters.enumerated() {
			let otherChar = string.characters[string.index(string.startIndex, offsetBy: i)]
			
			if let mappedChar = map[char] {
				if mappedChar != otherChar {
					return false
				}
			} else {
				if map.values.contains(otherChar) {
					return false
				}
				
				map[char] = otherChar
			}
		}
		
		return true
		
	}
	
	
}
