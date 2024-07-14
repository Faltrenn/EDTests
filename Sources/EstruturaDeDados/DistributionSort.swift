//
//  DistributionSort.swift
//
//
//  Created by Emanuel on 03/07/24.
//

import Foundation


public func distributionSort(v: inout [Int32]) {
    distributionSort(v: &v, n: v.count)
}

func distributionSort(v: inout [Int32], n: Int) {
    let s = Int(v.min()!)
    let b = Int(v.max()!)
    var c: [Int] = []
    var w: [Int] = []
    for _ in 0..<(b - s + 2) {
        c.append(0)
    }
    for i in 0..<n {
        c[Int(v[i]) - s + 1] = c[Int(v[i]) - s + 1] + 1
        w.append(0)
    }
    for i in 1..<(b - s + 2) {
        c[i] += c[i - 1]
    }
    for i in 0..<n {
        let d = Int(v[i]) - s + 1
        w[c[d] - 1] = Int(v[i])
        c[d] -= 1
    }
    for i in 0..<n {
        v[i] = Int32(w[i])
    }
}
