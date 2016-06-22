//
//  StackQueue.swift
//  
//
//  Created by Mari Batilando on 6/21/16.
//
//

import Foundation

struct Stack<T> {
    private var array = [T]()
    
    var peek: T? {
        return self.array.last
    }
    
    var isEmpty: Bool {
        return self.array.isEmpty
    }
    
    mutating func pop() -> T {
        return self.array.removeLast()
    }
    
    mutating func push(_ element: T) {
        self.array.append(element)
    }
    
}

struct Queue<T> {
    private var array = [T]()
    
    var peek: T? {
        return self.array.first
    }
    
    var isEmpty: Bool {
        return self.array.isEmpty
    }
    
    mutating func dequeue() -> T {
        return self.array.removeFirst()
    }
    
    mutating func enqueue(_ element: T) {
        self.array.append(element)
    }
    
}
