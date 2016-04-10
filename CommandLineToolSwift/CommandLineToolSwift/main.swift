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

//Load File from path

class Parser {
    
    func parseAccount(file:String) -> [Account] {
        
        var array = [Account]()
        
        let data = file.componentsSeparatedByString(",")
        
        var accounts:[Int] = [Int]()
        var ammounts:[Int] = [Int]()
        
        var count = 0
        for it in data {
            
            if let object = Int(it) {
                
                let control = count%2
                
                switch control {
                case 0:
                    accounts.append(object)
                default:
                    ammounts.append(object)
                }
                count = count+1
            }
            
        }
        
        count = 0
        for acc in accounts {
            let accountObject = Account()
            accountObject.account = acc
            accountObject.ammount = ammounts[count]
            count = count+1
            array.append(accountObject)
        }
        
        return array
    }
    
    func parseTransaction(file:String) -> [Transaction] {
        
        var array = [Transaction]()
        
        let data = file.componentsSeparatedByString(",")
        
        var accounts:[Int] = [Int]()
        var transactions:[Int] = [Int]()
        
        var count = 0
        for it in data {
            
            if let object = Int(it) {
                
                let control = count%2
                
                switch control {
                case 0:
                    accounts.append(object)
                default:
                    transactions.append(object)
                }
                count = count+1
            }
            
        }
        
        count = 0
        for acc in accounts {
            let accountObject = Transaction()
            accountObject.account = acc
            accountObject.transaction = transactions[count]
            count = count+1
            array.append(accountObject)
        }
        
        return array
    }

    
}

class Loader {
    
    func loadFile(path:String, returnWithDelimiter:Bool) -> String {
        
        let pathScaned = scanString(path, delimiter: ",", returnWithDelimiter: false)
        
        if let file = NSFileManager.defaultManager().contentsAtPath(pathScaned),
            let fileData = String(data: file, encoding: NSUTF8StringEncoding) {
            return scanString(fileData, delimiter: ",", returnWithDelimiter: true)
        }
        
        return String()
        
    }
    
    func scanString(text:String, delimiter:String, returnWithDelimiter:Bool) -> String {
        
        let lines:[String] = text.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as [String]
        var values:[String] = []
        
        for line in lines {
            
            if line != "" {
                
                if line.rangeOfString("\"") != nil {
                    var textToScan:String = line
                    var value:NSString?
                    var textScanner:NSScanner = NSScanner(string: textToScan)
                    while textScanner.string != "" {
                        
                        if (textScanner.string as NSString).substringToIndex(1) == "\"" {
                            textScanner.scanLocation += 1
                            textScanner.scanUpToString("\"", intoString: &value)
                            textScanner.scanLocation += 1
                        } else {
                            textScanner.scanUpToString(delimiter, intoString: &value)
                        }
                        
                        values.append(value as! String)
                        
                        if textScanner.scanLocation < textScanner.string.characters.count {
                            textToScan = (textScanner.string as NSString).substringFromIndex(textScanner.scanLocation + 1)
                        } else {
                            textToScan = ""
                        }
                        textScanner = NSScanner(string: textToScan)
                    }
                    
                } else  {
                    values = line.componentsSeparatedByString(delimiter)
                }
                
            }
            
        }
        
        if returnWithDelimiter {
            return values.joinWithSeparator(",")
        } else {
            return values.joinWithSeparator("")
        }

    }
    
}

class Account {
    var account:Int? = nil
    var ammount:Int? = nil
}

class Transaction {
    var account:Int? = nil
    var transaction:Int? = nil
    
}

let loader = Loader()
let parser = Parser()

//let acc = parser.parseAccount(loader.loadFile("/Users/mateuscampos/Desktop/teste.CSV"))

let fileScaned = loader.loadFile(inputString!, returnWithDelimiter:true)
//let accs = parser.parseAccount(fileScaned)
let trans = parser.parseTransaction(fileScaned)

//Pase file into a object