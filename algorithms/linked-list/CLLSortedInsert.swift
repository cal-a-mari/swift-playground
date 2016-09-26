//
//  CLLSortedInsert.swift
//  Test
//
//  Created by Mari Batilando on 9/25/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func sortedInsert<T>(_ value: T, inCircularlyLinkedList cll: LinkedList<T>) {
    let newNode = LinkedListNode(value: value)
    
    if cll.head == nil { // List Is Empty
        newNode.next = newNode
        cll.head = newNode
    } else if cll.head!.value >= value { // New node is the new head
        var curr = cll.head!
        
        while curr.next !== cll.head! {
            curr = curr.next!
        }
        
        curr.next = newNode
        newNode.next = cll.head
        cll.head = newNode
    } else { // New node is to be inserted somewhere after the head
        var curr = cll.head!
        
        while curr.next !== cll.head && curr.next!.value < value {
            curr = curr.next!
        }
        
        newNode.next = curr.next
        curr.next = newNode
    }
}

func cllSortedInsertTests() {
    let cll1 = LinkedList<Int>()
    sortedInsert(1, inCircularlyLinkedList: cll1)
    assert(cll1.description == "[1]")
    
    sortedInsert(3, inCircularlyLinkedList: cll1)
    assert(cll1.description == "[1, 3]")
    
    sortedInsert(2, inCircularlyLinkedList: cll1)
    assert(cll1.description == "[1, 2, 3]")
    
    sortedInsert(-1, inCircularlyLinkedList: cll1)
    assert(cll1.description == "[-1, 1, 2, 3]")
    
    print("Done")
}
