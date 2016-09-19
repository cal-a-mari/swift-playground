//
//  TopologicalSort.swift
//  Test
//
//  Created by Mari Batilando on 9/18/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension GraphProtocol {
    var topologicalSort: [Vertex<T>] {
        var visited = Set<T>()
        var stack = Stack<Vertex<T>>()
        var res = [Vertex<T>]()
        
        for vertex in self.canvas {
            self.topologicalSort(node: vertex, visited: &visited, stack: &stack)
        }
        
        while !stack.isEmpty {
            res.append(stack.pop())
        }
        
        return res
    }
    
    private func topologicalSort(node: Vertex<T>, visited: inout Set<T>, stack: inout Stack<Vertex<T>>) {
        if visited.contains(node.value) {
            return
        } else {
            visited.insert(node.value)
        }
        
        for edge in node.neighbors {
            self.topologicalSort(node: edge.neighbor, visited: &visited, stack: &stack)
        }
        
        stack.push(element: node)
    }
}

func topologicalSortTests() {
    let graph = DirectedGraph()
    let node1 = graph.add(1)
    let node2 = graph.add(2)
    let node3 = graph.add(3)
    let node4 = graph.add(4)
    let node5 = graph.add(5)
    let node6 = graph.add(6)
    let node7 = graph.add(7)
    
    graph.addEdge(fromSource: node1, toDestination: node3, weight: 0)
    graph.addEdge(fromSource: node3, toDestination: node4, weight: 0)
    graph.addEdge(fromSource: node4, toDestination: node6, weight: 0)
    graph.addEdge(fromSource: node6, toDestination: node7, weight: 0)
    graph.addEdge(fromSource: node2, toDestination: node3, weight: 0)
    graph.addEdge(fromSource: node2, toDestination: node5, weight: 0)
    graph.addEdge(fromSource: node5, toDestination: node6, weight: 0)
    
    let res = graph.topologicalSort
    print(res)
}
