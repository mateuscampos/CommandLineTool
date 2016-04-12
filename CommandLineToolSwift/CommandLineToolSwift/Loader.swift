//
//  Loader.swift
//  CommandLineToolSwift
//
//  Created by Mateus Campos on 11/04/16.
//  Copyright © 2016 Mateus Campos. All rights reserved.
//

import Foundation


class Loader {
    
    func loadFile(path:String, returnWithDelimiter:Bool) -> String {
        
        let pathScaned = scanString(path, delimiter: ",", returnWithDelimiter: false)
        
        if let file = NSFileManager.defaultManager().contentsAtPath(pathScaned),
            let fileData = String(data: file, encoding: NSUTF8StringEncoding) {
            return scanString(fileData, delimiter: ",", returnWithDelimiter: true)
        } else {
            print("Please, run again and insert a valid path")
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