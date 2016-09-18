//
//  CompareLinkedListStrings.swift
//  Test
//
//  Created by Mari Batilando on 7/24/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension LinkedList {
    
    static func compare(listA: LinkedList<Character>, listB: LinkedList<Character>) -> Int {
        var ptrA = listA.head
        var ptrB = listB.head
        
        while (ptrA != nil) && (ptrB != nil) && (ptrA?.value == ptrB?.value) {
            ptrA = ptrA!.next
            ptrB = ptrB!.next
        }
        
        if (ptrA == nil) && (ptrB == nil) {
            return 0
        }
        
        if let a = ptrA?.value, let b = ptrB?.value {
            return a > b ? 1 : -1
        }
        
        return -1
    }
    
}

func ==(lhs: LinkedList<Character>, rhs: LinkedList<Character>) -> Bool {
    return LinkedList<Character>.compare(listA: lhs, listB: rhs) == 0
}

func <(lhs: LinkedList<Character>, rhs: LinkedList<Character>) -> Bool {
    return LinkedList<Character>.compare(listA: lhs, listB: rhs) == -1
}

func <=(lhs: LinkedList<Character>, rhs: LinkedList<Character>) -> Bool {
    let res = LinkedList<Character>.compare(listA: lhs, listB: rhs)
    return res == 0 || res == -1
}

func >(lhs: LinkedList<Character>, rhs: LinkedList<Character>) -> Bool {
    return LinkedList<Character>.compare(listA: lhs, listB: rhs) == 1
}

func >=(lhs: LinkedList<Character>, rhs: LinkedList<Character>) -> Bool {
    let res = LinkedList<Character>.compare(listA: lhs, listB: rhs)
    return res == 0 || res == 1
}
