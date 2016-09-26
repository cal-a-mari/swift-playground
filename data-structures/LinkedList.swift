//
//  LinkedList.swift
//  Test
//
//  Created by Mari Batilando on 7/24/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

final class LinkedList<T> where T: Comparable, T: Equatable, T: Hashable {
    typealias Node = LinkedListNode<T>
    var head: Node?
}

extension LinkedList: CustomStringConvertible {
    
    var description: String {
        var res = [T]()
        
        guard let head = self.head else {
            return String(describing: res)
        }
        
        res.append(head.value)
        var currNode = head.next
        
        while let node = currNode, node !== self.head {
            res.append(node.value)
            currNode = currNode!.next
        }
        
        return String(describing: res)
    }
    
}

final class LinkedListNode<T> where T:Comparable, T: Equatable, T: Hashable {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
    
}

extension LinkedListNode: CustomStringConvertible {
    var description: String {
        return "[value: \(self.value)]"
    }
}

func ==(lhs: LinkedListNode<Int>, rhs: LinkedListNode<Int>) -> Bool {
    return lhs.value == rhs.value
}

func<(lhs: LinkedListNode<Int>, rhs: LinkedListNode<Int>) -> Bool {
    return lhs.value < rhs.value
}

func >(lhs: LinkedListNode<Int>, rhs: LinkedListNode<Int>) -> Bool {
    return lhs.value > rhs.value
}

func <=(lhs: LinkedListNode<Int>, rhs: LinkedListNode<Int>) -> Bool {
    return lhs.value <= rhs.value
}

func >=(lhs: LinkedListNode<Int>, rhs: LinkedListNode<Int>) -> Bool {
    return lhs.value >= rhs.value
}
