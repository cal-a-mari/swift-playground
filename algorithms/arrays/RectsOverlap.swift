//
//  RectsOverlap.swift
//  Kata
//
//  Created by Mari Batilando on 8/29/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation
import CoreGraphics

/*
	Given two rectangles, find if the given two rectangles overlap or not.

	Note that a rectangle can be represented by two coordinates, top left and bottom right. So mainly we are given following four coordinates.
	l1: Top Left coordinate of first rectangle.
	r1: Bottom Right coordinate of first rectangle.
	l2: Top Left coordinate of second rectangle.
	r2: Bottom Right coordinate of second rectangle.

doOverlap(l1, r1, l2, r2) that returns true if the two given rectangles overlap.
*/


/*
	BruteForce O(m*n): One by one pick all points of one rectangle and see if the point lies inside the other rectangle or not

	Trick: Two rectangles do not overlap if one of the following conditions is true.
	1) One rectangle is above top edge of other rectangle.
	2) One rectangle is on left side of left edge of other rectangle.
*/
// O(1)
func rectsOverlap(l1: CGPoint, r1: CGPoint, l2: CGPoint, r2: CGPoint) -> Bool {
	if l1.x > r2.x || l2.x > r1.x {
		return false
	}
	
	if l1.y < r2.y || l2.y < r1.y {
		return false
	}
	
	return true
}

func bruteRectsOverlap(l1: CGPoint, r1: CGPoint, l2: CGPoint, r2: CGPoint) -> Bool {
	for x in Int(l1.x)...Int(r1.x) {
		for y in Int(l1.y)...Int(r1.y) {
			print(x, y)
			if x >= Int(l2.x) && x <= Int(r2.x) && y >= Int(l2.y) && y <= Int(r2.y) {
				return true
			}
		}
	}
	
	return false
}

func rectsOverlapTests() {
	let l1 = CGPoint(x: 3, y: 0)
	let r1 = CGPoint(x: 10, y: 5)
	let l2 = CGPoint(x: 5, y: 0)
	let r2 = CGPoint(x: 11, y: 6)
	
	print(bruteRectsOverlap(l1: l1, r1: r1, l2: l2, r2: r2))
	
	let l3 = CGPoint(x: 3, y: 0)
	let r3 = CGPoint(x: 10, y: 5)
	let l4 = CGPoint(x: 3, y: 6)
	let r4 = CGPoint(x: 11, y: 7)
	
	print(bruteRectsOverlap(l1: l3, r1: r3, l2: l4, r2: r4))
}
