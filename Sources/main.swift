//
//  main.swift
//  EDTests
//
//  Created by Emanuel on 10/07/24.
//

import Foundation
import EstruturaDeDados


var testPath: URL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath + "/tests", isDirectory: true)
FileManager.default.createDirectoryIfNotExists(at: testPath)

print(URL(fileURLWithPath: algorithm.getTestFileName(cs: .better), relativeTo: testPath).path)
let algorithm: Algorithms = .quick
print("start")
openFile(url: URL(fileURLWithPath: algorithm.getTestFileName(cs: .better), relativeTo: testPath)) { file in
    for i in stride(from: 100, through: 10000, by: 100) {
        var times: [UInt64] = []
        var arr = algorithm.getTestArray(cs: .better, difficulty: i)
        for _ in 1...10 {
            times.append(testAlgorithm(file: file, arr: &arr, execution: algorithm.function))
        }
        times.sort()
        let time = (times[4] + times[5])/2
        file.seekToEndOfFile()
        file.write("\(time)\n".data(using: .utf8)!)
        print("done")
    }
}
print("done!")

//for algorithm in Algorithms.allCases {
//    for cs in Algorithms.Cases.allCases {
//        if algorithm.hasCase(cs: cs) {
//            print("\(algorithm) start")
//            openFile(url: testPath.appending(path: algorithm.getTestFileName(cs: cs))) { file in
//                for i in stride(from: 100, through: 10000, by: 100) {
//                    var times: [UInt64] = []
//                    var arr = algorithm.getTestArray(cs: cs, difficulty: i)
//                    for _ in 1...10 {
//                        times.append(testAlgorithm(file: file, arr: &arr, execution: algorithm.function))
//                    }
//                    times.sort()
//                    let time = (times[4] + times[5])/2
//                    file.seekToEndOfFile()
//                    file.write("\(time)\n".data(using: .utf8)!)
//                }
//            }
//            print("done")
//        }
//    }
//}
