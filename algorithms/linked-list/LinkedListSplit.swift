//
//  LinkedListSplit.swift
//  Test
//
//  Created by Mari Batilando on 9/25/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/// Splits a linked list into halves. If the length is odd, then the extra node goes into the first half
func split<T>(node: LinkedListNode<T>) -> (front: LinkedListNode<T>?, back: LinkedListNode<T>?) {
    var fast: LinkedListNode<T>?
    var slow: LinkedListNode<T>?
    
    // Length < 2
    if node.next == nil {
        return (node, nil)
    }
    
    slow = node
    fast = node.next
    
    while fast != nil {
        fast = fast!.next
        
        if fast != nil {
            slow = slow!.next
            fast = fast!.next
        }
    }
    
    let front = node
    let back = slow!.next
    slow!.next = nil
    return (front, back)
}

func llSplitTests() {
    let node1 = LinkedListNode(value: 1)
    let node2 = LinkedListNode(value: 3)
    let node3 = LinkedListNode(value: 2)
    let node4 = LinkedListNode(value: 4)
    node1.next = node2
    node2.next = node3
    node3.next = node4
    
    let res = split(node: node1)
    let ll1 = LinkedList<Int>()
    ll1.head = res.front
    let ll2 = LinkedList<Int>()
    ll2.head = res.back
    
    assert(ll1.description == "[1, 3]")
    assert(ll2.description == "[2, 4]")
    
    let node5 = LinkedListNode(value: 5)
    let res2 = split(node: node5)
    let ll3 = LinkedList<Int>()
    ll3.head = res2.front
    
    let ll4 = LinkedList<Int>()
    ll4.head = res2.back
    
    assert(ll3.description == "[5]")
    assert(ll4.description == "[]")
}
