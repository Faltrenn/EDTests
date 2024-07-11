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

var arr = [0, 3, 1, 5, 9, 13, 21, 20, 7]
quickSort(v: &arr)
print(arr)
