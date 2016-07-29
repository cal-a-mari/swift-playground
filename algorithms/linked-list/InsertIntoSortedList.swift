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
        guard let head = self.head else {
            // If this is the first node going to be inserted
            self.head = LinkedListNode<T>(value: value)
            return
        }
        
        let nodeToInsert = LinkedListNode<T>(value: value)
        
        if value < head.value {
            // If this is the new head of the linked list
            nodeToInsert.next = head
            self.head = nodeToInsert
            return
        }
        
        var ptrA = head
        var ptrB = ptrA.next
        
        while ptrB != nil {
            if value < ptrB!.value {
                // Normal case for inserting a value in the middle of the list
                nodeToInsert.next = ptrB!.next
                ptrB!.next = nil
                ptrA.next = nodeToInsert
                return
            } else {
                ptrA = ptrB!
                ptrB = ptrB!.next
            }
        }
        
        // Edge case for the node being the new tail
        ptrA.next = nodeToInsert
    }
    
}
