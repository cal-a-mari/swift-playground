//
//  SearchMaze.swift
//  Test
//
//  Created by Mari Batilando on 10/1/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation
import CoreGraphics

struct Point: Equatable, CustomStringConvertible {
    let x: Int
    let y: Int
    
    var description: String {
        return "(\(self.x), \(self.y))"
    }
}

func ==(lhs: Point, rhs: Point) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}

func search(maze: [[Int]], start: Point, end: Point) -> [Point] {
    if maze.isEmpty || maze.first!.isEmpty {
        return []
    }
    
    var res = [Point]()
    var maze = maze
    let found = search(maze: &maze, curr: start, end: end, res: &res)
    if found {
        res.insert(start, at: 0)
    }
    
    return res
}

private func search(maze: inout [[Int]], curr: Point, end: Point, res: inout [Point]) -> Bool {
    if curr == end {
        return true
    }
    
    let points = [Point(x: curr.x, y: curr.y - 1),
                  Point(x: curr.x, y: curr.y + 1),
                  Point(x: curr.x - 1, y: curr.y),
                  Point(x: curr.x + 1, y: curr.y)]
    
    for point in points {
        if validPoint(maze: maze, point: point) {
            maze[point.y][point.x] = 1
            
            if search(maze: &maze, curr: point, end: end, res: &res) {
                res.insert(point, at: 0)
                return true
            }
        }
    }
    
    return false
}

private func validPoint(maze: [[Int]], point: Point) -> Bool {
    return point.x < maze.first!.count &&
        point.x >= 0 &&
        point.y < maze.count &&
        point.y >= 0 &&
        maze[point.y][point.x] == 0
}

func searchMazeTests() {
    let maze1 = [[0, 1, 0],
                 [0, 1, 0],
                 [0, 0, 0]]
    let start1 = Point(x: 0, y: 0)
    let end1 = Point(x: 2, y: 0)
    let res1 = "[(0, 0), (0, 1), (0, 2), (1, 2), (2, 2), (2, 1), (2, 0)]"
    let actualRes1 = search(maze: maze1, start: start1, end: end1)
    assert(res1 == String(describing: actualRes1))
    
    let maze2 = [[0, 1, 0],
                 [0, 1, 0],
                 [0, 1, 0]]
    let res2 = "[]"
    let actualRes2 = search(maze: maze2, start: start1, end: end1)
    assert(res2 == String(describing: actualRes2))
    
    print("Done")
}
