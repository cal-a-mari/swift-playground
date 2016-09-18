//
//  WordLadder.swift
//  Test
//
//  Created by Mari Batilando on 9/5/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Given two words (start and end), and a dictionary, find the length of shortest transformation 
 sequence from start to end, such that only one letter can be changed at a time and each intermediate 
 word must exist in the dictionary. For example, given:
 
 start = "hit"
 end = "cog"
 dict = ["hot","dot","dog","lot","log"]
 
 One shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog", the program should return its length 4.
 */

private struct WordNode {
    let word: String
    let numTransformations: Int
}

// O(length of word * length of word)
func numberOfTransformations(beginWord: String, endWord: String, words: Set<String>) -> Int {
    var queue = Queue<WordNode>()
    queue.enqueue(WordNode(word: beginWord, numTransformations: 0))
    
    var words = words
    words.insert(endWord)
    
    while !queue.isEmpty {
        let dequeued = queue.dequeue()
        let dequeuedWord = dequeued.word
        
        if dequeuedWord == endWord {
            return dequeued.numTransformations
        }
        
        let chars = dequeuedWord.characters.map { $0 }
        
        for i in 0..<chars.count {
            for alphabet in UnicodeScalar("a").value...UnicodeScalar("z").value {
                var newChars = chars
                newChars[i] = Character(UnicodeScalar(alphabet)!)
                let newWord = String(newChars)
                
                if words.contains(newWord) {
                    queue.enqueue(WordNode(word: newWord,
                                           numTransformations: dequeued.numTransformations + 1))
                    words.remove(newWord)
                }
            }
        }
    }
    
    return 0
}

func numberOfTransformationsTests() {
    let start1 = "hit"
    let end1 = "cog"
    let words1 = Set<String>(["hot","dot","dog","lot","log"])
    
    print("Should be 4: \(numberOfTransformations(beginWord: start1, endWord: end1, words: words1))")
}
