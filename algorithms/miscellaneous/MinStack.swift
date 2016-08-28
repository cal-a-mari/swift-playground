//
//  MinStack.swift
//  Test
//
//  Created by Mari Batilando on 8/27/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
 
 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 getMin() -- Retrieve the minimum element in the stack.
 */

private class MinStackElement<T> {
    let value: T
    let min: T
    var next: MinStackElement<T>?
    
    init(value: T, min: T) {
        self.value = value
        self.min = min
    }
}

class MinStack<T: Comparable> {
    
    private var topElement: MinStackElement<T>?
    
    func push(_ element: T) {
        if let top = self.topElement {
            let minVal = min(element, top.value)
            let newElement = MinStackElement(value: element, min: minVal)
            newElement.next = self.topElement
            self.topElement = newElement
        } else {
            self.topElement = MinStackElement(value: element, min: element)
        }
    }
    
    func pop() -> T? {
        if let topElement = self.topElement {
            self.topElement = topElement.next
            return topElement.value
        }
        
        return nil
    }
    
    func top() -> T? {
        return self.topElement?.value
    }
    
    func getMin() -> T? {
        return self.topElement?.min
    }
}
