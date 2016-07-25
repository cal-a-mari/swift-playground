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
        
        guard self.head != nil else {
            self.head = newNode
            return
        }
        
        var ptrA = self.head!
        var ptrB = self.head?.next
        
        while ptrB?.value < value && ptrB != nil {
            ptrA = ptrA.next!
            ptrB = ptrB?.next
        }
        
        if ptrB == nil {
            ptrA.next = newNode
        } else {
            newNode.next = ptrA.next
            ptrA.next = newNode
        }
    }
    
}
