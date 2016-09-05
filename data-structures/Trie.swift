//
//  Trie.swift
//  Test
//
//  Created by Mari Batilando on 9/4/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

class TrieNode {
    var children = [TrieNode]()
    var isLeaf = false
    let key: Character
    
    init(key: Character) {
        self.key = key
    }
}

class Trie {
    
    var root = TrieNode(key: Character(" ")) // TODO: Find a better way to signify root
    
    // O(length of key)
    func add(key: String) {
        guard key.characters.count > 0 else {
            return
        }
        
        let chars = key.characters.map { $0 }
        
        var currNode = self.root
        
        for char in chars {
            if let indexOfChar = currNode.children.index(where: { $0.key == char }) {
                currNode = currNode.children[indexOfChar]
            } else {
                let newNode = TrieNode(key: char)
                currNode.children.append(newNode)
                currNode = newNode
            }
        }
        
        currNode.isLeaf = true
    }
    
    // O(length of key)
    func search(key: String) -> Bool {
        guard key.characters.count > 0 else {
            return false
        }
        
        let chars = key.characters.map { $0 }
        var currNode = self.root
        
        for char in chars {
            if let indexOfChar = currNode.children.index(where: { $0.key == char }) {
                currNode = currNode.children[indexOfChar]
            } else {
                return false
            }
        }
        
        return currNode.isLeaf
    }
    
}

func trieTests() {
    let trie = Trie()
    trie.add(key: "bob")
    print("Should be true: \(trie.search(key: "bob"))")
    print("Should be false: \(trie.search(key: "boa"))")
    
    trie.add(key: "mari")
    print("Should be true: \(trie.search(key: "mari"))")
    print("Should be false: \(trie.search(key: "mar"))")

    
}
