//
//  StackQueue.swift
//  
//
//  Created by Mari Batilando on 6/21/16.
//
//

import Foundation

final class Stack<T> {
    private var array = [T]()
    
    var peek: T? {
        return self.array.last
    }
    
    func pop() -> T {
        return self.array.removeLast()
    }
    
    func push(element: T) {
        self.array.append(element)
    }
    
}

final class Queue<T> {
    private var array = [T]()
    
    var peek: T? {
        return self.array.first
    }
    
    func dequeue() -> T {
        return self.array.removeFirst()
    }
    
    func enqueue(element: T) {
        self.array.insert(element, at: 0)
    }
}
    
