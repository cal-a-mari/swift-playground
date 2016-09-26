//
//  LinkedListRotate.swift
//  Test
//
//  Created by Mari Batilando on 9/25/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation
/*
     You are given a singly linked list, rotate the linked list
     counter-clockwise by k nodes. Where k is a given positive integer.
     
     i.e. if the given linked list is: 1->2->3->4->5 and k is 3,
     the list should be modified to: 4->5->1->2->3.
     Assume that k is smaller than the number of nodes in linked list.
 */
// O(n)
func rotate<T>(_ ll: LinkedList<T>, k: Int) {
    if ll.head == nil {
        return
    }
    
    var curr = ll.head
    var i = 1
    
    while i < k && curr != nil {
        curr = curr!.next
        i += 1
    }
    
    if curr == nil {
        return
    }
    
    let kth = curr
    
    while curr!.next != nil {
        curr = curr!.next
    }
    
    curr!.next = ll.head
    ll.head = kth!.next
    kth!.next = nil
}

func llRotateTests() {
    let node1 = LinkedListNode(value: 1)
    let node2 = LinkedListNode(value: 2)
    let node3 = LinkedListNode(value: 3)
    let node4 = LinkedListNode(value: 4)
    let node5 = LinkedListNode(value: 5)
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    
    let ll1 = LinkedList<Int>()
    ll1.head = node1
    rotate(ll1, k: 3)
    
    assert(ll1.description == "[4, 5, 1, 2, 3]")
}
