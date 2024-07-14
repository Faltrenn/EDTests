//
//  MergeSort.swift
//
//
//  Created by Emanuel on 03/07/24.
//

import Foundation


public func mergeSort(v: inout [Int32]) {
    mergeSort(v: &v, s: 0, e: v.count-1)
}

func mergeSort(v: inout [Int32], s: Int, e: Int) {
    if s < e {
        let m = (s+e)/2
        mergeSort(v: &v, s: s, e: m)
        mergeSort(v: &v, s: m+1, e: e)
        merge(v: &v, s: s, m: m, e: e)
    }
}

func merge(v: inout [Int32], s: Int, m: Int, e: Int) {
    var p = s
    var q = m + 1
    var w: [Int32] = []
    for _ in 0..<(e - s + 1) {
        if (q > e) || ((p <= m) && (v[p] < v[q])) {
            w.append(v[p])
            p += 1
        } else {
            w.append(v[q])
            q += 1
        }
    }
    for i in (0..<(e - s + 1)) {
        v[s + i] = w[i]
    }
}
