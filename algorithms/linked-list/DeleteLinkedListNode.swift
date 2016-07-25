//
//  DeleteLinkedListNode.swift
//  Test
//
//  Created by Mari Batilando on 7/24/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation


extension LinkedList {
    
    func delete(value: T) {
        guard let currNode = self.head else {
            return
        }
        
        if currNode.value == value {
            // When the value we need to delete is the head of the linked list
            self.head = currNode.next
        }
        
        var ptrA = currNode
        var ptrB = currNode.next
        
        while ptrB != nil {
            if ptrB!.value == value {
                // Normal case if the value is in the middle of the list
                ptrA.next = ptrB!.next
                ptrB!.next = nil
                return
            } else {
                ptrA = ptrB!
                ptrB = ptrB!.next
            }
        }
    }
    
}
