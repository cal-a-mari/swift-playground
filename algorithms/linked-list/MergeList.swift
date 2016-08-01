//
//  MergeList.swift
//  Test
//
//  Created by Mari Batilando on 7/31/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension LinkedList {
    
    func merge(withList list: LinkedList) {
        // Edge Case: Merging empty list
        guard list.head != nil else {
            return
        }
        
        // Edge Case: List is empty
        guard self.head != nil else {
            self.head = list.head
            list.head = nil
            return
        }
        
        var ptrA = self.head
        var ptrB = ptrA!.next
        
        var ptrC = list.head
        var ptrD = ptrC!.next
        
        while ptrA != nil {
            guard let nodeToMerge = ptrC else {
                // Terminate if there are no more nodes to merge
                break
            }
            
            ptrA!.next = nodeToMerge
            nodeToMerge.next = ptrB
            
            ptrA = ptrB
            ptrB = ptrB?.next
            
            ptrC = ptrD
            ptrD = ptrD?.next
        }
        
        list.head = ptrC
    }
    
}
