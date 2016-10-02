//
//  ComputeBalancedParens.swift
//  Test
//
//  Created by Mari Batilando on 10/1/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation
/*
    Returns a list of all strings that have k pairs of matched parens
 */
func computeBalancedParens(k: Int) -> [String] {
    var res = [String]()
    parensHelper(str: [Character](), k: k, open: 0, close: 0, res: &res)
    return res
}

private func parensHelper(str: [Character], k: Int, open: Int, close: Int, res: inout [String]) {
    if close == k {
        res.append(String(str))
        return
    }
    
    
    if open > close {
        var newStr = str
        newStr.append(")")
        parensHelper(str: newStr, k: k, open: open, close: close + 1, res: &res)
    }
    
    if open < k {
        var newStr = str
        newStr.append("(")
        parensHelper(str: newStr, k: k, open: open + 1, close: close , res: &res)
    }
}

func testComputeBalancedParens() {
    let res1 = computeBalancedParens(k: 1)
    print(res1)
    
    let res2 = computeBalancedParens(k: 2)
    print(res2)
    
    print("Done")
}
