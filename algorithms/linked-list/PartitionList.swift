//
//  PartitionList.swift
//  Test
//
//  Created by Mari Batilando on 9/24/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.
 
 You should preserve the original relative order of the nodes in each of the two partitions.
 
 For example,
 Given 1->4->3->2->5->2 and x = 3,
 return 1->2->2->4->3->5.
 */
// O(n) runtime and O(1) space
func partition(ll: LinkedList<Int>, val: Int) {
    if ll.head == nil {
        return
    }
    
    let less = LinkedListNode(value: 0)
    let great = LinkedListNode(value: 0)
    
    var l = less
    var g = great
    
    var curr: LinkedListNode<Int>? = ll.head!
    
    while curr != nil {
        if curr!.value < val {
            l.next = curr
            l = l.next!
        } else {
            g.next = curr
            g = g.next!
        }
        
        let temp = curr!.next
        curr!.next = nil
        curr = temp
    }
    
    l.next = great.next
    ll.head = less.next
}

func partitionTests() {
    let node1 = LinkedListNode(value: 1)
    let node2 = LinkedListNode(value: 4)
    let node3 = LinkedListNode(value: 3)
    let node4 = LinkedListNode(value: 2)
    let node5 = LinkedListNode(value: 5)
    let node6 = LinkedListNode(value: 2)
    
    let ll1 = LinkedList<Int>()
    ll1.head = node1
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    node5.next = node6
    
    partition(ll: ll1, val: 3)
    assert(ll1.description == "[1, 2, 2, 4, 3, 5]")
    
    let node7 = LinkedListNode(value: 1)
    let ll2 = LinkedList<Int>()
    ll2.head = node7
    partition(ll: ll2, val: 2)
    assert(ll2.description == "[1]")
    
    let node8 = LinkedListNode(value: 1)
    let node9 = LinkedListNode(value: 10)
    node8.next = node9
    let ll3 = LinkedList<Int>()
    ll3.head = node8
    partition(ll: ll3, val: 5)
    assert(ll3.description == "[1, 10]")
    
    print("Done")
}
