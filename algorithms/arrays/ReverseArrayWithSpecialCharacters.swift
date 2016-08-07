//
//  ReverseArrayWithSpecialCharacters.swift
//  Test
//
//  Created by Mari Batilando on 8/6/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Array where Element: Hashable {
    
    mutating func reverse(exceptSpecialCharacters chars: Set<Element>) {
        guard self.count >= 2 else {
            return
        }
        var leftIndex = self.startIndex
        var rightIndex = self.index(self.endIndex, offsetBy: -1)
        
        while leftIndex < rightIndex {
            if !chars.contains(self[leftIndex]) && !chars.contains(self[rightIndex]) {
                swap(&self[leftIndex], &self[rightIndex])
                leftIndex += 1
                rightIndex -= 1
            } else if chars.contains(self[leftIndex]) {
                leftIndex += 1
            } else if chars.contains(self[rightIndex]) {
                rightIndex -= 1
            }
        }
    }
}
