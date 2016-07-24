//
//  LinkedList.swift
//  Test
//
//  Created by Mari Batilando on 7/24/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

final class LinkedList<T where T: Comparable, T: Equatable> {
    typealias Node = LinkedListNode<T>
    var head: Node?
}

final class LinkedListNode<T where T:Comparable, T: Equatable> {
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
