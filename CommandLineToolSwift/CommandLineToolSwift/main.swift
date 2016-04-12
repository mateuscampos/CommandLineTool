//
//  main.swift
//  CommandLineToolSwift
//
//  Created by Mateus Campos on 10/04/16.
//  Copyright © 2016 Mateus Campos. All rights reserved.
//

import Foundation

let stdin = NSFileHandle.fileHandleWithStandardInput()
let inputString = String(data: stdin.availableData, encoding: NSUTF8StringEncoding)

let loader = Loader()
let parser = Parser()

let pathScaned = loader.scanString(inputString!, delimiter: ",", returnWithDelimiter: true)
let paths = parser.parsePath(pathScaned)

let fileAcc = loader.loadFile((paths.first?.filePath)!, returnWithDelimiter:true)
let fileTransaction = loader.loadFile((paths.last?.filePath)!, returnWithDelimiter: true)

let accounts = parser.parseAccount(fileAcc)
let transactions = parser.parseTransaction(fileTransaction)

