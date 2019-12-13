//
//  MinHeapTests.swift
//  DataStructureExplorerTests
//
//  Created by Daniel Greenheck on 11/8/19.
//  Copyright © 2019 Daniel Greenheck. All rights reserved.
//

import XCTest

class MinHeapTests: XCTestCase {
    var heap: MinHeap<Int> = MinHeap<Int>()
    
    override func setUp() {
        heap = MinHeap<Int>()
    }

    func test_insert_singleValue() {
        // When
        heap.insert(0)
        // Then
        XCTAssert(heap.count == 1)
    }
    
    func test_remove_fromEmptyHeap() {
        // When
        let min = heap.remove()
        // Then
        XCTAssertNil(min)
        XCTAssert(heap.count == 0)
    }
    
    func test_remove_fromSingleHeap() {
        // Given
        heap.insert(45)
        // When
        let min = heap.remove()
        // Then
        XCTAssert(min == 45)
        XCTAssert(heap.count == 0)
    }
    
    func test_remove_fromMultiValuedHeap() {
        // Given
        heap.insert(15)
        heap.insert(8)
        heap.insert(23)
        heap.insert(34)
        // When
        let firstMin = heap.remove()
        let secondMin = heap.remove()
        // Then
        XCTAssert(firstMin == 8)
        XCTAssert(secondMin == 15)
        XCTAssert(heap.count == 2)
    }
    
    func test_min_empty() {
        // When
        // Then
        XCTAssertNil(heap.min())
        XCTAssert(heap.count == 0)
    }
    
    func test_min_singleValue() {
        // When
        heap.insert(10)
        // Then
        XCTAssert(heap.min() == 10)
        XCTAssert(heap.count == 1)
    }
    
    func test_min_multipleDistinctValuesWithMinFirst() {
        // When
        heap.insert(1)
        heap.insert(2)
        heap.insert(3)
        // Then
        XCTAssert(heap.min() == 1)
        XCTAssert(heap.count == 3)
    }
    
    func test_min_multipleDistinctValuesWithMinLast() {
        // When
        heap.insert(5)
        heap.insert(10)
        heap.insert(3)
        // Then
        XCTAssert(heap.min() == 3)
        XCTAssert(heap.count == 3)
    }
    
    func test_min_multipleDistinctValuesWithMinMiddle() {
        // When
        heap.insert(300)
        heap.insert(156)
        heap.insert(245)
        // Then
        XCTAssert(heap.min() == 156)
        XCTAssert(heap.count == 3)
    }
    
    func test_min_positiveAndNegativeNumbers() {
        // When
        heap.insert(-5)
        heap.insert(10)
        heap.insert(-20)
        heap.insert(-3)
        heap.insert(6)
        // Then
        XCTAssert(heap.min() == -20)
        XCTAssert(heap.count == 5)
    }
    
    func test_min_tenThousandNumbers() {
        // When
        // Insert the minimum last
        for i in (0..<10000).reversed() {
            heap.insert(i)
        }
        // Then
        XCTAssert(heap.min() == 0)
        XCTAssert(heap.count == 10000)
    }
}
