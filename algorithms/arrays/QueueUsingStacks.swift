//
//  QueueUsingStacks.swift
//  Test
//
//  Created by Mari Batilando on 8/28/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Implement the following operations of a queue using stacks.
 
 push(x) -- Push element x to the back of queue.
 pop() -- Removes the element from in front of queue.
 peek() -- Get the front element.
 empty() -- Return whether the queue is empty.
 */

class CustomQueue<T> {
    
    var temp = Stack<T>()
    var value = Stack<T>()
    
    var isEmpty: Bool {
        return self.value.isEmpty
    }
    
    //O(n)
    func push(_ element: T) {
        if self.value.isEmpty {
            self.value.push(element: element)
        } else {
            while !self.value.isEmpty {
                self.temp.push(element: self.value.pop())
            }
            
            self.value.push(element: element)
            
            while !self.temp.isEmpty {
                self.value.push(element: self.temp.pop())
            }
        }
        
    }
    
    func pop() -> T? {
        return self.value.pop()
    }
    
    func peek() -> T? {
        return self.value.peek
    }
    
}
