//
//  ReverseWordsInString.swift
//  Test
//
//  Created by Mari Batilando on 8/21/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation
/*
 Given an input string, reverse the string word by word. A word is defined as a sequence of non-space characters.
 
 The input string does not contain leading or trailing spaces and the words are always separated by a single space.
 
 For example,
 Given s = "the sky is blue",
 return "blue is sky the".
 */
// O(n) runtime and O(1) space
func reverseWords(inString string: String) -> String {
    var wordBegin = 0
    var string = string.characters.map { $0 }
    
    for i in 0..<string.count {
        if string[i] == Character(" ") {
            reverse(array: &string, start: wordBegin, end: i - 1)
            wordBegin = i + 1
        }
    }
    
    reverse(array: &string, start: wordBegin, end: string.count - 1) // reverse the last word
    reverse(array: &string, start: 0, end: string.count - 1) // reverse the entire array
    
    return String(string)
}

private func reverse(array: inout [Character], start: Int, end: Int) {
    var start = start
    var end = end
    
    while start < end {
        swap(&array[start], &array[end])
        start += 1
        end -= 1
    }
}

func reverseWordsTests() {
    let words1 = "the sky is blue"
    print("Should be: blue is sky the: \(reverseWords(inString: words1))")
    
    let words2 = "i like dogs"
    print("Should be: dogs like i: \(reverseWords(inString: words2))")
    
    let words3 = "i"
    print("Should be i: \(reverseWords(inString: words3))")
}




