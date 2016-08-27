//
//  LRUCache.swift
//  Test
//
//  Created by Mari Batilando on 8/27/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and set.
 
 get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
 set(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
 */

class LRUCacheNode {
    let key: String
    var value: AnyObject
    var next: LRUCacheNode?
    var prev: LRUCacheNode?
    
    init(key: String, value: AnyObject) {
        self.key = key
        self.value = value
    }
}

class LRUCacheLinkedList {
    var head: LRUCacheNode?
    
    func removeTail() -> LRUCacheNode? {
        guard let head = self.head else {
            return nil
        }
        
        // Edge Case: Only 1 node in LL
        if head.next == nil {
            self.head = nil
            return head
        }
        
        var curr = head
        
        while curr.next != nil {
            curr = curr.next!
        }
        
        curr.prev?.next = nil
        curr.prev = nil
        
        return curr
    }
    
    func setHead(withKey key: String, value: AnyObject) -> LRUCacheNode {
        let newHead = LRUCacheNode(key: key, value: value)
        
        if self.head == nil {
            self.head = newHead
        } else {
            self.head!.prev = newHead
            newHead.next = self.head
            self.head = newHead
        }
        
        return self.head!
    }
    
    func removeNode(withKey key: String) -> LRUCacheNode? {
        guard let head = self.head else {
            return nil
        }
        
        // Edge Case: Only 1 node in LL
        if head.next == nil && head.key == key {
            self.head = nil
            return head
        }
        
        var currNode: LRUCacheNode? = head
        
        while currNode != nil {
            if currNode!.key == key {
                currNode!.prev?.next = currNode!.next
                currNode!.next?.prev = currNode!.prev
                return currNode
            } else {
                currNode = currNode!.next
            }
        }
        
        return currNode
    }
    
}

class LRUCache {
    
    private var map = [String: LRUCacheNode]()
    private var ll = LRUCacheLinkedList()
    var size: Int
    
    init(size: Int) {
        self.size = size
    }
    
    func get(_ key: String) -> AnyObject? {
        print("Getting \(key): \(self.map[key])")
        return self.map[key]?.value
    }
    
    func set(key: String, value: AnyObject) {
        print("Inserting: \(key)")
        if let _ = self.map[key] {
            print("Replacing old value of: \(key)")
            let _ = self.ll.removeNode(withKey: key)
            self.map[key] = self.ll.setHead(withKey: key, value: value)
        } else {
            self.map[key] = self.ll.setHead(withKey: key, value: value)
            
            if self.map.keys.count > size {
                if let removed = self.ll.removeTail() {
                    print("Removing: \(removed.key)")
                    self.map.removeValue(forKey: removed.key)
                }
            }
        }
    }
    
}
