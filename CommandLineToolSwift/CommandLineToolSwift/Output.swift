//
//  Output.swift
//  CommandLineToolSwift
//
//  Created by Mateus Campos on 12/04/16.
//  Copyright © 2016 Mateus Campos. All rights reserved.
//

import Foundation

class Output {
    
    func output(output:[Account]) {
        
        var outputArray:Array<String>! = Array()
        
        for it in output {
            outputArray.append(String(it.account))
            outputArray.append(String(it.ammount))
        }
        
        let transactionString = outputArray.joinWithSeparator(",")
        
        let file = "output.csv"
        
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            
            let path = dir.stringByAppendingPathComponent(file)
            
            do {
                try transactionString.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
                print("Transactions Saved in: \(path)")
            }
            catch {
                print("Could not save file")
            }
            
        }
        
    }
    
}