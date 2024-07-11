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

    func testName(cs: Cases) -> String {
        return "\(self)-\(cs)"
    }
}

func openFile(url: URL, execution: (FileHandle) -> Void) throws {
    try "".write(to: url, atomically: true, encoding: .utf8)
    let file = try FileHandle(forWritingTo: url)

    execution(file)

    file.closeFile()
}

func getRandomArray(n: Int) -> [Int] {
    var list: [Int] = []
    for _ in 0..<n {
        list.append(Int.random(in: 0...n))
    }
    return list
}

func testAlgorithm(file: FileHandle, arr: inout [Int], difficulty: Int, execution: (inout [Int]) -> Void) {
    let t1 = DispatchTime.now().uptimeNanoseconds
    execution(&arr)
    let delta = DispatchTime.now().uptimeNanoseconds - t1

    let line = "\(difficulty) \(delta)\n"
    if let data = line.data(using: .utf8) {
        file.seekToEndOfFile()
        file.write(data)
    }
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
         let exists = FileManager.default.fileExists(atPath: at.path(percentEncoded: false), isDirectory: &isDirectory)
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
