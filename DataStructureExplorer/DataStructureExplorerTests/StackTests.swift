//
//  StackTests.swift
//  DataStructureExplorerTests
//
//  Created by Daniel Greenheck on 10/31/19.
//  Copyright © 2019 Daniel Greenheck. All rights reserved.
//

import XCTest

class StackTests: XCTestCase {

    private var uut: Stack<Int> = Stack()
    
    override func setUp() {
        uut = .init()
    }
    
    
    // ----------------- push() ------------------- //
    
    func test_push_ontoEmptyStack() {
        // When
        uut.push(5)
        // Then
        XCTAssertTrue(uut.peek() == 5)
    }
    
    func test_push_multipleItems() {
        // Given
        uut.push(0)
        uut.push(1)
        // When
        uut.push(2)
        // Then
        XCTAssertTrue(uut.peek() == 2)
        XCTAssertTrue(uut.count == 3)
    }
    
    
    // ----------------- pop() ------------------- //
    
    func test_pop_fromEmptyList() {
        // When
        let value: Int? = uut.pop()
        // Then
        XCTAssertNil(value)
        XCTAssertTrue(uut.count == 0)
    }
    
    func test_pop_singleItem() {
        // Given
        uut.push(0)
        // When
        let value: Int? = uut.pop()
        // Then
        XCTAssertTrue(value == 0)
        XCTAssertNil(uut.peek())
        XCTAssertTrue(uut.count == 0)
    }
    
    func test_pop_multipleItems() {
        // Given
        uut.push(0)
        uut.push(1)
        uut.push(2)
        // When
        let firstValue: Int? = uut.pop()
        let secondValue: Int? = uut.pop()
        let thirdValue: Int? = uut.pop()
        // Then
        XCTAssertTrue(firstValue == 2)
        XCTAssertTrue(secondValue == 1)
        XCTAssertTrue(thirdValue == 0)
        XCTAssertNil(uut.peek())
        XCTAssertTrue(uut.count == 0)
    }
    
    
    // ----------------- peek() ------------------- //
    
    func test_peek_onEmptyStack() {
        // Then
        XCTAssertNil(uut.peek())
        XCTAssertTrue(uut.count == 0)
    }
    
    func test_peek_onNonEmptyStack() {
        // Given
        uut.push(0)
        // Then
        XCTAssertTrue(uut.peek() == 0)
        XCTAssertTrue(uut.count == 1)
    }
}
