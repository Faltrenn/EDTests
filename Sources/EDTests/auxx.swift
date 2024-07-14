//
//  aux.swift
//  EDTests
//
//  Created by Emanuel on 10/07/24.
//

import Foundation
import CCode
import EstruturaDeDados


enum Algorithms: CaseIterable {
    enum Cases: CaseIterable {
        case better, medium, worst
    }

    case selection, insertion, merge, quick, distribution

    var function: (_ arr: inout [Int32]) -> Void {
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

    func getTestArray(cs: Cases, difficulty: Int32) -> [Int32] {
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

func bestCaseQuicksort(n: Int32) -> [Int32] {
    guard n > 0 else { return [] }
    var array = Array(1...n)
    createBestCaseArray(&array, start: 0, end: n - 1)
    return array
}

func createBestCaseArray(_ array: inout [Int32], start: Int32, end: Int32) {
    if start >= end { return }
    let mid = (start + end) / 2
    array.swapAt(Int(start), Int(mid))
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

func getRandomArray(n: Int32) -> [Int32] {
    var list: [Int32] = []
    for _ in 0..<n {
        list.append(Int32.random(in: 0...n))
    }
    return list
}

func testAlgorithm(arr: inout [Int32], execution: (inout [Int32]) -> Void) -> UInt64 {
    let t1 = DispatchTime.now().uptimeNanoseconds
    execution(&arr)
    return DispatchTime.now().uptimeNanoseconds - t1
}

func makeAndSaveTest(algorithm: Algorithms, cs: Algorithms.Cases, testPath: URL) {
    guard algorithm.hasCase(cs: cs) else {
        print("\(algorithm) doesnt have \(cs) case")
        return
    }
    print("start \(algorithm) \(cs)")
    openFile(url: testPath.appending(path: algorithm.getTestFileName(cs: cs))) { file in
        for i in stride(from: 100, through: 10000, by: 100) {
            var times: [UInt64] = []
            for _ in 1...10 {
                var arr = algorithm.getTestArray(cs: cs, difficulty: Int32(i))
                times.append(testAlgorithm(arr: &arr, execution: algorithm.function))
            }
            times.sort()
            let time = (times[4] + times[5])/2
            file.seekToEndOfFile()
            file.write("\(time)\n".data(using: .utf8)!)
        }
    }
    print("done!")
}

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
