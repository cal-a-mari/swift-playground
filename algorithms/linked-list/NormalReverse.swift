//
//  NormalReverse.swift
//  Test
//
//  Created by Mari Batilando on 7/31/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension LinkedList {
    
    func reverse() {
        var curr: LinkedListNode<T>? = self.head
        var prev: LinkedListNode<T>?
        var next: LinkedListNode<T>?
        
        while curr != nil {
            next = curr!.next
            curr!.next = prev
            prev = curr
            curr = next
        }
        
        self.head = prev
    }
    
}
