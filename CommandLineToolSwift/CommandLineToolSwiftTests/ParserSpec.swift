//
//  ParserSpec.swift
//  CommandLineToolSwift
//
//  Created by Mateus Campos on 12/04/16.
//  Copyright © 2016 Mateus Campos. All rights reserved.
//

import XCTest
@testable import CommandLineToolSwift

class ParserSpec: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testParser() {
        
        let parser = Parser()
        
        XCTAssertNotNil(parser, "should not be nil")
        
        let object = "/Users/mateuscampos/Documents/Mateus/Projetos/CommandLineTool/CommandLineToolSwift/resources/accs.csv,/Users/mateuscampos/Documents/Mateus/Projetos/CommandLineTool/CommandLineToolSwift/resources/transactions.csv"
        
        let parsedObject = parser.parsePath(object)
        
        XCTAssertNotNil(parsedObject, "should not be nil")
        
    }

}
