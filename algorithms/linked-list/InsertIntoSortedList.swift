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
        let nodeToInsert = LinkedListNode(value: value)
        
        guard let head = self.head else {
            // Edge Case: If this is the first node to be inserted
            self.head = nodeToInsert
            return
        }
        
        // Edge Case: If this is the new head
        if value < head.value {
            nodeToInsert.next = head
            self.head = nodeToInsert
        }
        
        var current = head
        var next = current.next
        
        while next != nil {
            if next!.value < value {
                // Normal case if the new node is to be inserted in the middle of the list
                current.next = nodeToInsert
                nodeToInsert.next = next!
                return
            }
            
            current = next!
            next = next!.next
        }
        
        // Edge case: If this is the new tail of the list
        current.next = nodeToInsert
    }
    
}
