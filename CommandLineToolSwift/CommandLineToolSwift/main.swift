//
//  main.swift
//  CommandLineToolSwift
//
//  Created by Mateus Campos on 10/04/16.
//  Copyright © 2016 Mateus Campos. All rights reserved.
//

import Foundation

//Read from imput
let stdin = NSFileHandle.fileHandleWithStandardInput()
let inputString = String(data: stdin.availableData, encoding: NSUTF8StringEncoding)

let loader = Loader()
let parser = Parser()

//let acc = parser.parseAccount(loader.loadFile("/Users/mateuscampos/Desktop/teste.CSV"))

let pathScaned = loader.scanString(inputString!, delimiter: ",", returnWithDelimiter: true)
let paths = parser.parsePath(pathScaned)

let fileScaned = loader.loadFile(inputString!, returnWithDelimiter:true)
//let accs = parser.parseAccount(fileScaned)
let trans = parser.parseTransaction(fileScaned)

//Pase file into a object