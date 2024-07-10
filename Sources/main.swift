//
//  main.swift
//  EDTests
//
//  Created by Emanuel on 10/07/24.
//

import Foundation
import EstruturaDeDados

FileManager.default.createDirectoryIfNotExists(at: .currentDirectory().appending(path: "tests"))

var arr = [0, 3, 1, 5, 9, 13, 21, 20, 7]
quickSort(v: &arr)
print(arr)
