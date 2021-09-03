//
//  ParaphraseTests.swift
//  ParaphraseTests
//
//  Created by endOfLine on 6/27/21.
//  Copyright © 2021 Hacking with Swift. All rights reserved.
//
@testable import Paraphrase
import XCTest

class ParaphraseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoadingInitialQuotes() {
        let model = QuotesModel(testing: true)
        XCTAssert(model.count == 12)
    }
    
    func testRandomQuote() {
        let model = QuotesModel(testing: true)
        guard let quote = model.random() else {
            XCTFail()
            return
        }
        XCTAssert(quote.author == "Eliot")
    }
    
    func testFormatting() {
        let model = QuotesModel(testing: true)
        let quote = model.quote(at: 0)
        
        let testString = "\"\(quote.text)\"\n   — \(quote.author)"
        XCTAssert(quote.multiline == testString)
    }
    
    func testAddingQute() {
        var model = QuotesModel(testing: true)
        let quoteCount = model.count
        
        let newQuote = Quote(author: "Philip Modin", text: "Do the things you must, then the things you want.")
        model.add(newQuote)
        
        XCTAssert(model.count == quoteCount + 1)
    }
    
    func testRemovingQuote() {
        var model = QuotesModel(testing: true)
        let quoteCount = model.count
        
        model.remove(at: 0)
        XCTAssert(model.count == quoteCount - 1)
    }
    
    func testReplacingQuote() {
        var model = QuotesModel(testing: true)
        
        let newQuote = Quote(author: "Some Person", text: "Some phrase")
        model.replace(index: 0, with: newQuote)
        
        let testQuote = model.quote(at: 0)
        XCTAssert(testQuote.author == "Some Person")
    }
    
    func testReplacingWithEmptyQuote() {
        var model = QuotesModel(testing: true)
        let previousCount = model.count
        
        let newQuote = Quote(author: "", text: "")
        model.replace(index: 0, with: newQuote)
        
        XCTAssert(model.count == previousCount - 1)
    }
}
