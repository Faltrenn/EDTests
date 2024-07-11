//
//  aux.swift
//  EDTests
//
//  Created by Emanuel on 10/07/24.
//

import Foundation
import EstruturaDeDados


enum Algorithms: CaseIterable {
    enum Cases: CaseIterable {
        case better, medium, worst

    }

    case selection, insertion, merge, quick, distribution

    var function: (_ arr: inout [Int]) -> Void {
        get {
            switch self {
                case .selection:
                    return selectionSort
                case .insertion:
                    return insertionSort
                case .merge:
                    return mergeSort
                case .quick:
                    return quickSort
                case .distribution:
                    return distributionSort
            }
        }
    }

    func hasCase(cs: Cases) -> Bool {
        switch self {
        case .selection:
            return cs == .medium
        case .insertion:
            return true
        case .merge:
            return cs == .medium
        case .quick:
            return true
        case .distribution:
            return cs == .medium
        }
    }

    func getTestFileName(cs: Cases) -> String {
        return "\(self)-\(cs).txt"
    }

    func getTestArray(cs: Cases, difficulty: Int) -> [Int] {
        if cs == .medium {
            return getRandomArray(n: difficulty)
        }
        if self == .insertion {
            return cs == .better ? Array(1...difficulty) : Array((1...difficulty).reversed())
        }
        // Se executa isso, ele definitivamente é o quick sort
        return cs == .better ? bestCaseQuicksort(n: difficulty) : Array(1...difficulty)
    }
}

func bestCaseQuicksort(n: Int) -> [Int] {
    guard n > 0 else { return [] }
    var array = Array(1...n)
    createBestCaseArray(&array, start: 0, end: n - 1)
    return array
}

func createBestCaseArray(_ array: inout [Int], start: Int, end: Int) {
    if start >= end { return }
    let mid = (start + end) / 2
    array.swapAt(start, mid)
    createBestCaseArray(&array, start: start + 1, end: mid)
    createBestCaseArray(&array, start: mid + 1, end: end)
}

func openFile(url: URL, execution: (FileHandle) -> Void) {
    do {
        try "".write(to: url, atomically: true, encoding: .utf8)
        let file = try FileHandle(forWritingTo: url)

        execution(file)

        file.closeFile()
    } catch {
        print(error)
    }
}

func getRandomArray(n: Int) -> [Int] {
    var list: [Int] = []
    for _ in 0..<n {
        list.append(Int.random(in: 0...n))
    }
    return list
}

func testAlgorithm(file: FileHandle, arr: inout [Int], execution: (inout [Int]) -> Void) -> UInt64 {
    let t1 = DispatchTime.now().uptimeNanoseconds
    execution(&arr)
    return DispatchTime.now().uptimeNanoseconds - t1
}

func getTestArray(cs: Algorithms.Cases, n: Int) -> [Int]{
    switch cs {
    case .better:
        Array(0..<n)
    case .medium:
        getRandomArray(n: n)
    case .worst:
        Array((0..<n).reversed())
    }
}

//func getTestExecution(testName: String) -> (inout [Int]) -> Void {
//    switch testName {
//    case "selection-sort":
//        return { (arr: inout [Int]) in
//            selectionSort(v: &arr, n: arr.count)
//        }
//    case "insertion-sort":
//        return { (arr: inout [Int]) in
//            insertionSort(v: &arr, n: arr.count)
//        }
//    case "merge-sort":
//        return { (arr: inout [Int]) in
//            mergeSort(v: &arr, s: 0, e: arr.count-1)
//        }
//    case "quick-sort":
//        return { (arr: inout [Int]) in
//            quickSort(v: &arr, s: 0, e: arr.count-1)
//        }
//    case _:
//        return { (arr: inout [Int]) in
//            distributionSort(v: &arr, n: arr.count)
//        }
//    }
//}

extension FileManager {
     func directoryExists(at: URL) -> Bool {
         var isDirectory : ObjCBool = true
         let exists = FileManager.default.fileExists(atPath: at.path, isDirectory: &isDirectory)
         return exists && isDirectory.boolValue
     }

     func createDirectoryIfNotExists(at: URL) {
         if !directoryExists(at: at) {
             do {
                 try FileManager.default.createDirectory(at: at, withIntermediateDirectories: false)
             } catch {
                 print(error)
             }
         }
     }
 }
