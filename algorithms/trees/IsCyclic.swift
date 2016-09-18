//
//  IsCyclic.swift
//  Test
//
//  Created by Mari Batilando on 9/17/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension GraphProtocol {
    
    // O(n) runtime and space
    var isCyclic: Bool {
        if self.canvas.isEmpty {
            return false
        }
        
        var stack = Stack<Vertex<T>>()
        stack.push(element: self.canvas.first!)
        var discovered = Set<T>()
        
        while !stack.isEmpty {
            let popped = stack.pop()
            
            if discovered.contains(popped.value) {
                return true
            } else {
                discovered.insert(popped.value)
            }
            
            for edge in popped.neighbors {
                stack.push(element: edge.neighbor)
            }
        }
        
        return false
    }
}

func cyclicTests() {
    let graph = DirectedGraph()
    let node1 = graph.add(1)
    let node2 = graph.add(2)
    let node3 = graph.add(3)
    graph.addEdge(fromSource: node1, toDestination: node2, weight: 0)
    graph.addEdge(fromSource: node2, toDestination: node3, weight: 0)
    assert(!graph.isCyclic)
    
    graph.addEdge(fromSource: node3, toDestination: node1, weight: 0)
    assert(graph.isCyclic)
    
    let graph2 = DirectedGraph()
    let node4 = graph2.add(4)
    graph2.addEdge(fromSource: node4, toDestination: node4, weight: 0)
    assert(graph2.isCyclic)
}
