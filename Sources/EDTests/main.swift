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

makeAndSaveTest(algorithm: .insertion, cs: .worst, testPath: testPath)