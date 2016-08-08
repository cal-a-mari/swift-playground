//
//  Graph.swift
//  Test

//
//  Created by Mari Batilando on 8/7/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

final class Edge<T where T: Equatable, T: Hashable> {
    var neighbor: Vertex<T>
    var weight: Int
    
    init(neighbor: Vertex<T>, weight: Int = 0) {
        self.neighbor = neighbor
        self.weight = weight
    }
}

final class Vertex<T where T: Equatable, T: Hashable> {
    var value: T
    var neighbors = [Edge<T>]()
    
    init(value: T) {
        self.value = value
    }
}

protocol GraphProtocol {
    associatedtype T: Hashable, Equatable
    
    var canvas: [Vertex<T>] { get set }
    var isDirected: Bool { get }
    
    func add(_ vertex: T) -> Vertex<T>
    func addEdge(fromSource source: Vertex<T>, toDestination destination: Vertex<T>, weight: Int?)
}

final class DirectedGraph: GraphProtocol {
    typealias T = Int
    
    var canvas = [Vertex<T>]()
    var isDirected: Bool {
        return true
    }
    
    func add(_ vertex: T) -> Vertex<T> {
        let newVertex = Vertex(value: vertex)
        self.canvas.append(newVertex)
        return newVertex
    }
    
    func addEdge(fromSource source: Vertex<T>, toDestination destination: Vertex<T>, weight: Int?) {
        let newEdge = Edge<T>(neighbor: destination, weight: weight ?? 0)
        source.neighbors.append(newEdge)
        
        if !self.isDirected {
            let returningEdge = Edge<T>(neighbor: source, weight: weight ?? 0)
            destination.neighbors.append(returningEdge)
        }
        
    }
    
}
