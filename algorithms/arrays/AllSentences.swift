//
//  AllSentences.swift
//  Test
//
//  Created by Mari Batilando on 9/1/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Given a list of word lists How to print all sentences possible taking one word from a list at a time via recursion?
 
 Input: {{"you", "we"},
 {"have", "are"},
 {"sleep", "eat", "drink"}}
 
 Output:
 you have sleep
 you have eat
 you have drink
 you are sleep
 you are eat
 you are drink
 we have sleep
 we have eat
 we have drink
 we are sleep
 we are eat
 we are drink
 */

func allSentences(fromWordList wordList: [[String]]) -> [String] {
    var sentences = [String]()
    allSentences(fromWordList: wordList, i: 0, currSentence: [String](), sentences: &sentences)
    return sentences
}

func allSentences(fromWordList wordList: [[String]], i: Int, currSentence: [String], sentences: inout [String]) {
    if wordList.isEmpty {
        return
    }
    
    if currSentence.count == wordList.count {
        let sentence = currSentence.joined(separator: " ")
        sentences.append(sentence)
        return
    }
    // O(m)
    for j in 0..<wordList[i].count {
        var newSentence = currSentence
        newSentence.append(wordList[i][j])
        //O(n)
        allSentences(fromWordList: wordList, i: i + 1, currSentence: newSentence, sentences: &sentences)
    }
}

func allSentencesTests() {
    let arr1 = [["you", "we"], ["drink", "dance"]]
    print("should be: [[you drink], [you dance], [we drink], [we dance]]: \(allSentences(fromWordList: arr1))")
    
    let arr2 = [["I"], ["dance"]]
    print("should be: [[I dance]]: \(allSentences(fromWordList: arr2))")
    
    let arr3 = [["I"], ["dance", "run"]]
    print("should be: [[I dance], [I run]]: \(allSentences(fromWordList: arr3))")
    
}
