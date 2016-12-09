//
//  Hanoi.swift
//  Kata
//
//  Created by Mari Batilando on 12/8/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation

func hanoi(disks: Int) {
	var pegs = [Int]()
	
	for i in 0..<disks {
		pegs.append(i)
	}
	
	var peg1 = Peg(id: .peg1, disks: pegs)
	var peg2 = Peg(id: .peg2, disks: [Int]())
	var peg3 = Peg(id: .peg3, disks: [Int]())
	
	print(pegs: peg1, peg2,peg3)
	hanoi(disks: disks, src: &peg1, aux: &peg2, dest: &peg3)
}

enum PegIdentifier {
	case peg1, peg2, peg3
}

struct Peg {
	let id: PegIdentifier
	var disks: [Int]
	
	mutating func insert(_ element: Int, at index: Int) {
		self.disks.insert(element, at: index)
	}
	
	mutating func removeFirst() -> Int {
		return self.disks.removeFirst()
	}
}

private func hanoi(disks: Int, src: inout Peg, aux: inout Peg, dest: inout Peg) {
	if disks == 1 {
		dest.insert(src.removeFirst(), at: 0)
		print(pegs: src, aux, dest)
	} else {
		hanoi(disks: disks - 1, src: &src, aux: &dest, dest: &aux)
		dest.insert(src.removeFirst(), at: 0)
		print(pegs: src, aux, dest)
		hanoi(disks: disks - 1, src: &aux, aux: &src, dest: &dest)
	}
}

private func print(pegs: Peg...) {
	var str = ""
	str += "Peg 1: \(String(pegs.filter { $0.id == .peg1 }.first!.disks.count)) "
	str += "Peg 2: \(String(pegs.filter { $0.id == .peg2 }.first!.disks.count)) "
	str += "Peg 3: \(String(pegs.filter { $0.id == .peg3 }.first!.disks.count)) "
	print(str)
}
