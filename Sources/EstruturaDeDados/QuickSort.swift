//
//  QuickSort.swift
//
//
//  Created by Emanuel on 03/07/24.
//

import Foundation


public func quickSort(v: inout [Int32]) {
    quickSort(v: &v, s: 0, e: v.count-1)
}

func quickSort(v: inout [Int32], s: Int, e: Int) {
    if s < e {
        let p = partition(v: &v, s: s, e: e)
        quickSort(v: &v, s: s, e: p - 1)
        quickSort(v: &v, s: p + 1, e: e)
    }
}

func partition(v: inout [Int32], s: Int, e: Int) -> Int {
    var d = s
    for i in s..<(e) {
        if v[i] <= v[e] {
            v.swapAt(d, i)
            d += 1
        }
    }
    v.swapAt(d, e)
    return d
}
