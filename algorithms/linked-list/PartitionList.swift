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
func partition(linkedList: LinkedList<Int>, x: Int) {
    if linkedList.head == nil {
        return
    }
    
    var currNode: LinkedListNode<Int>? = linkedList.head
    
    let greaterThanList = LinkedListNode(value: 0)
    var tail = greaterThanList
    
    let lessThanList = LinkedListNode(value: 0)
    lessThanList.next = linkedList.head
    var pre = lessThanList
    
    while currNode != nil {
        if currNode!.value >= x {
            pre.next = currNode!.next
            tail.next = currNode
            tail = tail.next!
            currNode = currNode!.next
            tail.next = nil
        } else {
            pre = currNode!
            currNode = currNode!.next
        }
    }
    
    pre.next = greaterThanList.next
    linkedList.head = lessThanList.next
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
    
    partition(linkedList: ll1, x: 3)
    print(ll1)
}
