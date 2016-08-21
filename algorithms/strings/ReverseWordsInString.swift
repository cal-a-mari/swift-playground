//
//  ReverseWordsInString.swift
//  Test
//
//  Created by Mari Batilando on 8/21/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension String {
    
    /*
     Given an input string, reverse the string word by word. A word is defined as a sequence of non-space characters.
     
     The input string does not contain leading or trailing spaces and the words are always separated by a single space.
     
     For example,
     Given s = "the sky is blue",
     return "blue is sky the".
     */
    // This is the best I could do it in Swift
    // The optimized way is to reverse each word then reverse the entire String
    // O(n) runtime and O(n) space
    var reversedWordsNaive: String {
        let wordArr = self.components(separatedBy: " ")
        return wordArr.reversed().joined(separator: " ")
    }
    
}





