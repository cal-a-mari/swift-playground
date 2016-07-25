//
//  InsertIntoSortedList.swift
//  Test
//
//  Created by Mari Batilando on 7/24/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension LinkedList {
    
    /// Note: This is for a sorted LinkedList
    func sortedInsert(value: T) {
        let newNode = LinkedListNode(value: value)
        
        guard let head = self.head where head.value < value  else {
            // When the new value we want to insert is the new head of the linked list
            newNode.next = self.head
            self.head = newNode
            return
        }
        
        var ptrA = head
        var ptrB = head.next
        
        while ptrB != nil && ptrB?.value < value {
            ptrA = ptrA.next!
            ptrB = ptrB?.next
        }
        
        // If the value we need to insert is the new tail of the list
        if ptrB == nil {
            ptrA.next = newNode
        } else {
            // This is the normal case if the value is in the middle of the linked list
            newNode.next = ptrA.next
            ptrA.next = newNode
        }
    }
    
}
