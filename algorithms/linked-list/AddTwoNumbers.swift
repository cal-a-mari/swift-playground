//
//  AddTwoNumbers.swift
//  Test
//
//  Created by Mari Batilando on 8/21/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

//O(n + m)
func add(ll1: LinkedList<Int>, ll2: LinkedList<Int>) -> LinkedList<Int> {
    var carry = 0
    let newHead = LinkedListNode(value: 0)
    var ptr1 = ll1.head
    var ptr2 = ll2.head
    var ptr3 = newHead
    
    while (ptr1 != nil) || (ptr2 != nil) {
        if ptr1 != nil {
            carry += ptr1!.value
            ptr1 = ptr1?.next
        }
        
        if ptr2 != nil {
            carry += ptr2!.value
            ptr2 = ptr2?.next
        }
        
        ptr3.next = LinkedListNode(value: carry % 10)
        ptr3 = ptr3.next!
        carry /= 10
    }
    
    if carry != 0 {
        ptr3.next = LinkedListNode(value: carry)
    }
    
    let newLL = LinkedList<Int>()
    newLL.head = newHead.next
    
    return newLL
}
