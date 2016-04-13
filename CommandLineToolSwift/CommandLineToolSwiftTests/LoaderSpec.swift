//
//  LoaderSpec.swift
//  CommandLineToolSwift
//
//  Created by Mateus Campos on 12/04/16.
//  Copyright © 2016 Mateus Campos. All rights reserved.
//

import XCTest
@testable import CommandLineToolSwift

class LoaderSpec: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testLoader() {
        
        let loader = Loader()
        
        XCTAssertNotNil(loader, "should not be nil")
        
        let object = "/Users/mateuscampos/Documents/Mateus/Projetos/CommandLineTool/CommandLineToolSwift/resources/accs.csv"
        
        let loadedObject = loader.loadFile(object, returnWithDelimiter: false)
        
        XCTAssertNotNil(loadedObject, "should not be nil")
        
    }

}
