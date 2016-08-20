//
//  Heap.swift
//  Kata
//
//  Created by Mari Batilando on 8/19/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation

protocol HeapProtocol {
    associatedtype Element: Comparable, Equatable
    
    var count: Int { get }
    
    func push(_ element: Element)
    func pop() -> Element?
    func siftUp()
    func siftDown()
}

final class MinHeap<T where T: Comparable, T: Equatable>: HeapProtocol {
    typealias Element = T
    
    private var array = [Element]()
    
    var count: Int {
        return self.array.count
    }
    
    var isEmpty: Bool {
        return self.array.isEmpty
    }
    
    func push(_ element: Element) {
        self.array.append(element)
        
        self.siftUp()
    }
    
    func pop() -> Element? {
        if self.array.count > 1 {
            swap(&self.array[0], &self.array[self.array.count - 1])
            let element = self.array.remove(at: self.array.count - 1)
            self.siftDown()
            return element
        }
        
        return self.array.popLast()
    }
    
    func siftUp() {
        var childIndex = self.count - 1
        var parentIndex = 0
        
        if childIndex != 0 {
            parentIndex = (childIndex - 1) / 2
        }
        
        while childIndex > 0 {
            let childToUse = self.array[childIndex]
            let parentToUse = self.array[parentIndex]
            
            if childToUse < parentToUse {
                swap(&self.array[childIndex], &self.array[parentIndex])
            }
            
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    func siftDown() {
        guard self.array.count > 1 else {
            return
        }
        
        var parentIndex = 0
        
        while parentIndex < self.array.count / 2 {
            let leftChild = self.array[2 * parentIndex]
            let rightChild = self.array[2 * parentIndex + 1]
            let minChildIndex = leftChild < rightChild ? (2 * parentIndex) : (2 * parentIndex + 1)
            let parent = self.array[parentIndex]
            
            if parent > leftChild || parent > rightChild {
                swap(&self.array[parentIndex], &self.array[minChildIndex])
            }
            
            parentIndex = minChildIndex
        }
    }
    
}

extension MinHeap: CustomStringConvertible {
    
    var description: String {
        return String(self.array)
    }
    
}
