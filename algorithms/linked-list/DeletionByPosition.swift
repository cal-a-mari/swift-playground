//
//  DeletionByPosition.swift
//  Test
//
//  Created by Mari Batilando on 9/25/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

// O(n)
func delete<T>(at index: Int, ll: LinkedList<T>) {
    if ll.head == nil {
        return
    }
    
    if index == 0 {
        ll.head = ll.head!.next
        return
    }
    
    var curr = ll.head
    var prev: LinkedListNode<T>?
    
    for _ in 0..<index {
        prev = curr
        curr = curr?.next
    }
    
    prev?.next = curr?.next
}

func deleteAtPositionTests() {
    let ll1 = LinkedList<Int>()
    let node1 = LinkedListNode(value: 5)
    let node2 = LinkedListNode(value: 3)
    let node3 = LinkedListNode(value: 5)
    ll1.head = node1
    node1.next = node2
    node2.next = node3
    delete(at: 1, ll: ll1)
    let res1 = "[5, 5]"
    assert(ll1.description == res1)
    
    let ll2 = LinkedList<Int>()
    let node4 = LinkedListNode(value: 1)
    ll2.head = node4
    delete(at: 0, ll: ll2)
    let res2 = "[]"
    assert(ll2.description == res2)
    
    let ll3 = LinkedList<Int>()
    let node5 = LinkedListNode(value: 1)
    let node6 = LinkedListNode(value: 1)
    ll3.head = node5
    node5.next = node6
    delete(at: 1, ll: ll3)
    let res3 = "[1]"
    assert(ll3.description == res3)
    
    let ll4 = LinkedList<Int>()
    let node7 = LinkedListNode(value: 7)
    ll4.head = node7
    delete(at: 5, ll: ll4)
    let res4 = "[7]"
    assert(ll4.description == res4)
}
