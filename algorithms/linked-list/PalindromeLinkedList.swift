//
//  PalindromeLinkedList.swift
//  Test
//
//  Created by Mari Batilando on 8/21/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension LinkedList {
    
    //O(n)
    var isPalindrome: Bool {
        guard let head = self.head else {
            return false
        }
        
        var original = [T]()
        var ptr = head
        
        while ptr.next != nil {
            original.append(ptr.value)
            ptr = ptr.next!
        }
        
        self.reverse()
        
        var reversed = [T]()
        ptr = self.head!
        
        while ptr.next != nil {
            reversed.append(ptr.value)
            ptr = ptr.next!
        }
        
        return original == reversed
    }
    
}
