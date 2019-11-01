//
//  StackTests.swift
//  DataStructureExplorerTests
//
//  Created by Daniel Greenheck on 10/31/19.
//  Copyright © 2019 Daniel Greenheck. All rights reserved.
//

import XCTest

class QueueTests: XCTestCase {

    private var uut: Queue<Int> = Queue()
    
    override func setUp() {
        uut = .init()
    }
    
    
    // ----------------- enqueue() ------------------- //
    
    func test_enqueue_ontoEmptyQueue() {
        // When
        uut.enqueue(5)
        // Then
        XCTAssertTrue(uut.peek() == 5)
    }
    
    func test_enqueue_multipleItems() {
        // Given
        uut.enqueue(5)
        uut.enqueue(6)
        // When
        uut.enqueue(7)
        // Then
        XCTAssertTrue(uut.peek() == 5)
        XCTAssertTrue(uut.count == 3)
    }
    
    
    // ----------------- dequeue() ------------------- //
    
    func test_dequeue_fromEmptyQueue() {
        // When
        let value: Int? = uut.dequeue()
        // Then
        XCTAssertNil(value)
        XCTAssertTrue(uut.isEmpty)
    }
    
    func test_dequeue_fromSingleItemQueue() {
        // Given
        uut.enqueue(1)
        // When
        let dequeuedValue: Int? = uut.dequeue()
        // Then
        XCTAssertTrue(dequeuedValue == 1)
        XCTAssertTrue(uut.isEmpty)
    }
    
    func test_dequeue_multipleItemsFromQueue() {
        // Given
        uut.enqueue(1)
        uut.enqueue(2)
        uut.enqueue(3)
        // When
        let firstValue: Int? = uut.dequeue()
        let secondValue: Int? = uut.dequeue()
        let thirdValue: Int? = uut.dequeue()
        // Then
        XCTAssertTrue(firstValue == 1)
        XCTAssertTrue(secondValue == 2)
        XCTAssertTrue(thirdValue == 3)
        XCTAssertTrue(uut.isEmpty)
    }
    
    
    // ----------------- peek() ------------------- //
    
    func test_peek_onEmptyQueue() {
        // Then
        XCTAssertNil(uut.peek())
        XCTAssertTrue(uut.isEmpty)
    }
    
    func test_peek_onNonEmptyQueue() {
        // Given
        uut.enqueue(5)
        // Then
        XCTAssertTrue(uut.peek() == 5)
        XCTAssertTrue(uut.count == 1)
    }
    
    
    // ----------------- isEmpty() ------------------- //
    
    func test_isEmpty_emptyQueue() {
        // Then
        XCTAssertTrue(uut.isEmpty)
    }
    
    func test_isEmpty_nonEmptyQueue() {
        // Given
        uut.enqueue(0)
        // Then
        XCTAssertFalse(uut.isEmpty)
    }
}
