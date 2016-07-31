//
//  ReverseInGroups.swift
//  Test
//
//  Created by Mari Batilando on 7/31/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension LinkedList {
    
    func reverse(byGroup group: Int) {
        guard let head = self.head else { return }
        
        self.head = self.reverse(head: head, group: group)
    }
    
    private func reverse(head: LinkedListNode<T>, group: Int) -> LinkedListNode<T> {
        var curr: LinkedListNode<T>? = head
        var prev: LinkedListNode<T>?
        var next: LinkedListNode<T>?
        var i = 0
        
        while curr != nil && i < group {
            next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
            i += 1
        }
        
        if let next = next {
            head.next = self.reverse(head: next, group: group)
        }
        
        return prev!
    }
    
}
