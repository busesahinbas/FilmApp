//
//  FilmAppTests.swift
//  FilmAppTests
//
//  Created by Buse Şahinbaş on 12.06.2023.
//

import XCTest
@testable import FilmApp

final class FilmAppTests: XCTestCase {
    
    let util = Util()
    
    func testSafelyHandleNA() {
        let input1 = "N/A"
        let input2 = ""
        let input3 = "Hello"
        let input4 = "Hello world"
        
        let output1 = util.safelyHandleNA(value: input1)
        let output2 = util.safelyHandleNA(value: input2)
        let output3 = util.safelyHandleNA(value: input3)
        let output4 = util.safelyHandleNA(value: input4)
        
        XCTAssertEqual(output1, "-")
        XCTAssertEqual(output2, "-")
        XCTAssertEqual(output3, "Hello")
        XCTAssertEqual(output4, "Hello world")
    }
    
    func testFormattedSearchTitle() {
        let input1 = "test test"
        let input2 = "  hello world "
        let input3 = "search movie"
        
        let output1 = util.formattedSearchTitle(inputSting: input1)
        let output2 = util.formattedSearchTitle(inputSting: input2)
        let output3 = util.formattedSearchTitle(inputSting: input3)
        
        XCTAssertEqual(output1, "test+test")
        XCTAssertEqual(output2, "hello+world")
        XCTAssertEqual(output3, "search+movie")
    }
}
