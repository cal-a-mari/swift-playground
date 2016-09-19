//
//  LongestPathInGraphs.swift
//  Test
//
//  Created by Mari Batilando on 9/18/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension GraphProtocol {
    
    /// Returns the longest path in a Directed Acyclic Graph
    func longestPath(fromVertex vertex: Vertex<T>) -> Int {
        if self.canvas.isEmpty {
            return 0
        }
        
        let topologicalSort = self.topologicalSort
        var distances = [T: Int]()
        
        for graphVertex in topologicalSort {
            distances[graphVertex.value] = Int.min
        }
        
        distances[vertex.value] = 0
        
        for graphVertex in topologicalSort {
            for edge in graphVertex.neighbors {
                if distances[edge.neighbor.value]! < distances[graphVertex.value]! + edge.weight {
                    distances[edge.neighbor.value] = distances[graphVertex.value]! + edge.weight
                }
            }
        }
        
        return distances.values.max()!
    }
    
    
}

func graphLongestPathTests() {
    let graph = DirectedGraph()
    let node1 = graph.add(1)
    let node2 = graph.add(2)
    let node3 = graph.add(3)
    let node4 = graph.add(4)
    
    graph.addEdge(fromSource: node1, toDestination: node2, weight: 3)
    graph.addEdge(fromSource: node2, toDestination: node4, weight: 2)
    graph.addEdge(fromSource: node1, toDestination: node3, weight: 5)
    graph.addEdge(fromSource: node3, toDestination: node4, weight: 7)
    
    assert(graph.longestPath(fromVertex: node1) == 12)
}
