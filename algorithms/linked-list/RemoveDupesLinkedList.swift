//
//  RemoveDupesLinkedList.swift
//  Test
//
//  Created by Mari Batilando on 9/25/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

// O(n^2)
func removeDuplicates1<T>(ll: LinkedList<T>)  {
    if ll.head == nil {
        return
    }
    
    var ptrA = ll.head
    
    while ptrA != nil && ptrA?.next != nil {
        var ptrB = ptrA
        
        while ptrB!.next != nil {
            if ptrA!.value == ptrB!.next?.value {
                ptrB!.next = ptrB!.next?.next
            } else {
                ptrB = ptrB!.next
            }
        }
        
        ptrA = ptrA!.next
    }
}

// O(n) runtime and space
func removeDuplicates2<T>(ll: LinkedList<T>) {
    if ll.head == nil {
        return
    }
    
    var curr: LinkedListNode<T>? = ll.head
    var prev = curr
    
    var vals = Set<T>()
    vals.insert(curr!.value)
    
    while curr != nil {
        if vals.contains(curr!.value) {
            prev!.next = curr!.next
            curr = curr!.next
        } else {
            vals.insert(curr!.value)
            prev = curr
            curr = curr!.next
        }
    }
}

func llRemoveDuplicatesTests() {
    let ll1 = LinkedList<Int>()
    let node1 = LinkedListNode(value: 5)
    let node2 = LinkedListNode(value: 3)
    let node3 = LinkedListNode(value: 5)
    ll1.head = node1
    node1.next = node2
    node2.next = node3
    removeDuplicates2(ll: ll1)
    print(ll1)
    
    let ll2 = LinkedList<Int>()
    let node4 = LinkedListNode(value: 1)
    ll2.head = node4
    removeDuplicates2(ll: ll2)
    print(ll2)
    
    let ll3 = LinkedList<Int>()
    let node5 = LinkedListNode(value: 1)
    let node6 = LinkedListNode(value: 1)
    ll3.head = node5
    node5.next = node6
    removeDuplicates2(ll: ll3)
    print(ll3)
}
