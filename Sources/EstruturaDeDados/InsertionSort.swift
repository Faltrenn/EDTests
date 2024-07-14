//
//  InsertionSort.swift
//
//
//  Created by Emanuel on 03/07/24.
//

import Foundation


public func insertionSort(v: inout [Int32]) {
    insertionSort(v: &v, n: v.count)
}

func insertionSort(v: inout [Int32], n: Int) {
    for i in 1..<n {
        var j = i
        while j > 0 && v[j - 1] > v[j] {
            v.swapAt(j, j-1)
            j -= 1
        }
    }
}
