//
//  Graph.swift
//  Test

//
//  Created by Mari Batilando on 8/7/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

final class Edge<T> where T: Equatable, T: Hashable, T: Comparable {
    var neighbor: Vertex<T>
    var weight: Int
    
    init(neighbor: Vertex<T>, weight: Int = 0) {
        self.neighbor = neighbor
        self.weight = weight
    }
}

final class Vertex<T>: Hashable, Equatable, Comparable where T: Equatable, T: Hashable, T: Comparable {
    var value: T
    var neighbors = [Edge<T>]()
    
    var hashValue: Int {
        return self.value.hashValue
    }
    
    init(value: T) {
        self.value = value
    }
}

func <<T>(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
    return lhs.value < rhs.value
}

func ><T>(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
    return lhs.value > rhs.value
}

func <=<T>(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
    return lhs.value <= rhs.value
}

func >=<T>(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
    return lhs.value >= rhs.value
}

func ==<T>(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
    return lhs.value == rhs.value
}

protocol GraphProtocol {
    associatedtype T: Hashable, Equatable, Comparable
    
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
