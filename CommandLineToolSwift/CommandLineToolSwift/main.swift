//
//  main.swift
//  CommandLineToolSwift
//
//  Created by Mateus Campos on 10/04/16.
//  Copyright © 2016 Mateus Campos. All rights reserved.
//

import Foundation

print("Provide a full path of a file separated by ',' (comma) ex: /Users/mateuscampos/Documents/Mateus/Projetos/CommandLineTool/CommandLineToolSwift/resources/accs.csv,/Users/mateuscampos/Documents/Mateus/Projetos/CommandLineTool/CommandLineToolSwift/resources/transactions.csv")
let stdin = NSFileHandle.fileHandleWithStandardInput()
let inputString = String(data: stdin.availableData, encoding: NSUTF8StringEncoding)

let loader = Loader()
let parser = Parser()
let bank = Bank()
let output = Output()

let pathScaned = loader.scanString(inputString!, delimiter: ",", returnWithDelimiter: true)
let paths = parser.parsePath(pathScaned)

let fileAcc = loader.loadFile((paths.first?.filePath)!, returnWithDelimiter:true)
let fileTransaction = loader.loadFile((paths.last?.filePath)!, returnWithDelimiter: true)

let accounts = parser.parseAccount(fileAcc)
let transactions = parser.parseTransaction(fileTransaction)
let accsTransaction = bank.manage(accounts, transactions: transactions)
output.output(accsTransaction)
