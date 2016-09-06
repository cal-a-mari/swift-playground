//
//  DFSGraph.swift
//  Test
//
//  Created by Mari Batilando on 9/5/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension GraphProtocol {
    
    var depthFirstTraversal: [T] {
        if self.canvas.isEmpty {
            return []
        }
        
        var stack = Stack<Vertex<T>>()
        stack.push(element: self.canvas.first!)
        var discovered = Set<T>()
        discovered.insert(self.canvas.first!.value)
        var res = [T]()
        
        while !stack.isEmpty {
            let popped = stack.pop()
            res.append(popped.value)
            
            for edge in popped.neighbors {
                if !discovered.contains(edge.neighbor.value) {
                    stack.push(element: edge.neighbor)
                    discovered.insert(edge.neighbor.value)
                }
            }
            
        }
        
        return res
    }
}

func dfsTests() {
    let graph = DirectedGraph()
    let node1 = graph.add(1)
    let node2 = graph.add(2)
    let node3 = graph.add(3)
    graph.addEdge(fromSource: node1, toDestination: node2, weight: 0)
    graph.addEdge(fromSource: node2, toDestination: node3, weight: 0)
    print("Should be [1, 2, 3]: \(graph.depthFirstTraversal)")
    
    graph.addEdge(fromSource: node3, toDestination: node1, weight: 0)
    print("Should be [1, 2, 3]: \(graph.depthFirstTraversal)")
    
    let node4 = graph.add(4)
    graph.addEdge(fromSource: node1, toDestination: node4, weight: 0)
    graph.addEdge(fromSource: node4, toDestination: node3, weight: 0)
    print("Should be [1, 4, 3, 2]: \(graph.depthFirstTraversal)")
    
    let graph2 = DirectedGraph()
    print("Should be []: \(graph2.depthFirstTraversal)")
    
}
