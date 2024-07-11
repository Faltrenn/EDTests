//
//  main.swift
//  EDTests
//
//  Created by Emanuel on 10/07/24.
//

import Foundation
import EstruturaDeDados

var testPath: URL = .currentDirectory().appending(path: "tests")
FileManager.default.createDirectoryIfNotExists(at: testPath)

for algorithm in Algorithms.allCases {
    for cs in Algorithms.Cases.allCases {
        if algorithm.hasCase(cs: cs) {
            openFile(url: testPath.appending(path: algorithm.testFileName(cs: cs))) { file in
                for i in stride(from: 0, through: 10000, by: 100) {
                    for _ in 1...10 {
                        print(i)
                    }
                }
            }
        }
    }
}
