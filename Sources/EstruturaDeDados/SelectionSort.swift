//
//  SelectionSort.swift
//
//
//  Created by Emanuel on 03/07/24.
//

import Foundation


public func selectionSort(v: inout [Int32]) {
    selectionSort(v: &v, n: v.count)
}

func selectionSort(v: inout [Int32], n: Int) {
    for i in 0..<n-1 {
        var m = i
        for j in (i+1)..<n {
            if v[m] > v[j] {
                m = j
            }
        }
        v.swapAt(i, m)
    }
}
