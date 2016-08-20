//
//  Heap.swift
//  Kata
//
//  Created by Mari Batilando on 8/19/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation

struct Heap<T: Comparable> {
    private var arr = [T]()
    private let isIncorrectOrder: (T, T) -> Bool
    
    var count: Int {
        return self.arr.count
    }
    
    var isEmpty: Bool {
        return self.arr.isEmpty
    }
    
    
    init(ascending: Bool = false, elements: [T] = []) {
        if ascending {
            self.isIncorrectOrder = { $0 > $1 }
        } else {
            self.isIncorrectOrder = { $0 < $1 }
        }
        
        self.arr = elements
        
        var i = self.arr.count / 2 - 1
        
        while i >= 0 {
            self.siftDown(i)
            i -= 1
        }
    }
    
    func peek() -> T? {
        return self.arr.first
    }
    
    mutating func push(_ element: T) {
        self.arr.append(element)
        self.siftUp(self.arr.count - 1)
    }
    
    mutating func pop() -> T? {
        if self.arr.isEmpty {
            return nil
        }
        
        if self.arr.count == 1 {
            return self.arr.popLast()
        }
        
        swap(&self.arr[0], &self.arr[self.arr.count - 1])
        let removed = self.arr.popLast()
        self.siftDown(0)
        
        return removed
    }
    
    mutating func clear() {
        self.arr.removeAll()
    }
    
    private mutating func siftDown(_ index: Int) {
        var i = index
        let leftChildIndex = 2 * i + 1
        
        while leftChildIndex < self.arr.count {
            var j = leftChildIndex
            
            // Check which child should be swapped
            if (j < self.arr.count - 1) && (self.isIncorrectOrder(self.arr[j], self.arr[j + 1])) {
                j += 1
            } else if !self.isIncorrectOrder(self.arr[i], self.arr[j]) {
                break
            }
            
            swap(&self.arr[i], &self.arr[j])
            i = j
        }
    }
    
    private mutating func siftUp(_ index: Int) {
        var i = index
        
        let parentIndex = (i - 1) / 2
        
        while i > 0 && self.isIncorrectOrder(self.arr[parentIndex], self.arr[i]) {
            swap(&self.arr[parentIndex], &self.arr[i])
            i = parentIndex
        }
    }
    
    
}
