//
//  Intersection.swift
//  Test
//
//  Created by Mari Batilando on 8/28/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

// O(n * m)
func intersection(ofListA llA: LinkedList<Int>, llB: LinkedList<Int>) -> LinkedListNode<Int>? {
    guard llA.head != nil && llB.head != nil else {
        return nil
    }
    
    var ptrA: LinkedListNode<Int>? = llA.head
    var ptrB: LinkedListNode<Int>? = llB.head
    
    while ptrA != nil {
        while ptrB != nil {
            if ptrB === ptrA {
                return ptrA
            } else {
                ptrB = ptrB!.next
            }
        }
        
        ptrA = ptrA!.next
        ptrB = llB.head
    }
    
    return nil
}

// O(n + m)
func intersection2(ofListA llA: LinkedList<Int>, llB: LinkedList<Int>) -> LinkedListNode<Int>? {
    guard llA.head != nil && llB.head != nil else {
        return nil
    }
    
    var countA = 0
    var ptrA = llA.head
    
    while ptrA != nil {
        countA += 1
        ptrA = ptrA!.next
    }
    
    var countB = 0
    var ptrB = llB.head
    
    while ptrB != nil {
        countB += 1
        ptrB = ptrB!.next
    }
    
    let diff = abs(countA - countB)
    ptrA = llA.head
    ptrB = llB.head
    
    if countA > countB {
        for _ in 0..<diff {
            ptrA = ptrA!.next
        }
    } else if countA == countB {
        for _ in 0..<diff {
            ptrB = ptrB!.next
        }
    }
    
    while ptrA != nil && ptrB != nil {
        if ptrA === ptrB {
            return ptrA
        } else {
            ptrA = ptrA!.next
            ptrB = ptrB!.next
        }
    }
    
    return nil
}
