//
//  Parser.swift
//  CommandLineToolSwift
//
//  Created by Mateus Campos on 11/04/16.
//  Copyright © 2016 Mateus Campos. All rights reserved.
//


class Parser {
    
    func parsePath(imput:String) -> [Path] {
        var array = [Path]()
        
        let data = imput.componentsSeparatedByString(",")
        
        for it in data {
            let path:Path = Path()
            path.filePath = it
            array.append(path)
        }
        
        return array
    }
    
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

