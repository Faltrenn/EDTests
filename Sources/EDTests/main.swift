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

makeAndSaveTest(algorithm: .quick, cs: .worst, testPath: testPath)

// [1, 2, 3, 4, 5, 6, 7, 8, 9]
// [1, 2, 3, 4] 5 [6, 7 ,8 ,9]
//var v = bestCaseQuicksort(n: 11)
//print(v)
//quickSort(v: &v)
//print(v)
