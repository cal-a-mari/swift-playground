//
//  LinkedListSortedMerge.swift
//  Test
//
//  Created by Mari Batilando on 9/25/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func sortedMerge<T>(a: LinkedListNode<T>?, b: LinkedListNode<T>?) -> LinkedListNode<T>? {
    if a == nil {
        return b
    }
    
    if b == nil {
        return a
    }
    
    var result: LinkedListNode<T>
    
    if a!.value <= b!.value {
        result = a!
        result.next = sortedMerge(a: a!.next, b: b!)
    } else {
        result = b!
        result.next = sortedMerge(a: a, b: b!.next)
    }
    
    return result
}

func sortedMergeTests() {
    let node1 = LinkedListNode(value: 1)
    let node2 = LinkedListNode(value: 3)
    node1.next = node2
    
    let node3 = LinkedListNode(value: 2)
    let node4 = LinkedListNode(value: 4)
    node3.next = node4
    
    let res1 = sortedMerge(a: node1, b: node3)
    let ll1 = LinkedList<Int>()
    ll1.head = res1
    assert(ll1.description == "[1, 2, 3, 4]")
    
    // Test 2
    let node5 = LinkedListNode(value: 5)
    
    let node6 = LinkedListNode(value: 7)
    let node7 = LinkedListNode(value: 8)
    node6.next = node7
    
    let res2 = sortedMerge(a: node5, b: node6)
    let ll2 = LinkedList<Int>()
    ll2.head = res2
    assert(ll2.description == "[5, 7, 8]")
    
    // Test 3
    let node8 = LinkedListNode(value: 9)
    let node9 = LinkedListNode(value: 10)
    node8.next = node9
    let ll3 = LinkedList<Int>()
    let res3 = sortedMerge(a: node8, b: nil)
    ll3.head = res3
    assert(ll3.description == "[9, 10]")
}
