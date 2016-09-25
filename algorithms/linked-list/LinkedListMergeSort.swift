//
//  LinkedListMergeSort.swift
//  Test
//
//  Created by Mari Batilando on 9/25/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func mergeSort<T>(ll: LinkedList<T>) {
    if ll.head == nil {
        return
    }
    
    ll.head = mergeSort(node: ll.head!)
}

private func mergeSort<T>(node: LinkedListNode<T>) -> LinkedListNode<T>? {
    if node.next == nil {
       return node
    }
    
    let listSplit = split(node: node)
    var front = listSplit.front
    var back = listSplit.back
    
    if front != nil {
        front = mergeSort(node: front!)
    }
    
    if back != nil {
        back = mergeSort(node: back!)
    }
    
    return sortedMerge(a: front, b: back)
}

func llMergeSortTests() {
    let node1 = LinkedListNode(value: 1)
    let node2 = LinkedListNode(value: 3)
    let node3 = LinkedListNode(value: 2)
    let node4 = LinkedListNode(value: 4)
    node1.next = node2
    node2.next = node3
    node3.next = node4
    let ll1 = LinkedList<Int>()
    ll1.head = node1
    mergeSort(ll: ll1)
    assert(ll1.description == "[1, 2, 3, 4]")
    
    let node5 = LinkedListNode(value: 5)
    let ll2 = LinkedList<Int>()
    ll2.head = node5
    mergeSort(ll: ll2)
    assert(ll2.description == "[5]")
    
    let ll3 = LinkedList<Int>()
    mergeSort(ll: ll3)
    assert(ll3.description == "[]")
}
