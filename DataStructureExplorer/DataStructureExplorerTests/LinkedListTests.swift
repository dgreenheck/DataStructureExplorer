//
//  LinkedListTests.swift
//  DataStructureExplorerTests
//
//  Created by Daniel Greenheck on 10/31/19.
//  Copyright © 2019 Daniel Greenheck. All rights reserved.
//

import XCTest

class LinkedListTests: XCTestCase {
    // Unit under test
    private var uut: LinkedList<Int> = LinkedList<Int>()
    
    override func setUp() {
        uut = LinkedList<Int>()
        _ = uut.append(LinkedListNode<Int>(0))
        _ = uut.append(LinkedListNode<Int>(1))
        _ = uut.append(LinkedListNode<Int>(2))
    }
    
    // ----------------- clear() --------------------- //
    
    func test_clear_nonEmptyList() {
        // When
        uut.clear()
        // Then
        XCTAssertNil(uut.head)
        XCTAssertNil(uut.tail)
        XCTAssertTrue(uut.count == 0)
    }
    
    func test_clear_emptyList() {
        // Given
        uut = LinkedList<Int>()
        // When
        uut.clear()
        // Then
        XCTAssertNil(uut.head)
        XCTAssertNil(uut.tail)
        XCTAssertTrue(uut.count == 0)
    }
    
    
    // ----------------- append() --------------------- //
    
    func test_append_singleNode() {
        // Given
        let node = LinkedListNode<Int>(3)
        // When
        let appendedNode = uut.append(node)
        // Then
        XCTAssertTrue(uut.tail === appendedNode)
        XCTAssertTrue(node.prev?.value == 2)
        XCTAssertNil(node.next)
    }

    
    // ------------------ get() ------------------------//
    
    func test_get_headNode() {
        // Given
        let headNode = uut.get(at: 0)
        // Then
        XCTAssertTrue(headNode === uut.head)
    }
    
    func test_get_tailNode() {
        // Given
        let tailNode = uut.get(at: uut.count - 1)
        // Then
        XCTAssertTrue(tailNode === uut.tail)
    }
    
    func test_get_middleNode() {
        // Given
        let node = uut.get(at: 1)
        // Then
        XCTAssertTrue(node?.value == 1)
    }
    
    func test_get_negativeIndex() {
        // Given
        let node = uut.get(at: -1)
        // Then
        XCTAssertNil(node)
    }
    
    func test_get_indexOutOfBounds() {
        // Given
        let node = uut.get(at: uut.count)
        // Then
        XCTAssertNil(node)
    }
    
    // ----------------- insert() --------------------- //
    
    func test_insert_middleOfList() {
        // Given
        let originalListCount = uut.count
        let nodeToInsert = LinkedListNode<Int>(3)
        let indexToInsertAt = 1
        // When
        let insertedNode = uut.insert(node: nodeToInsert, at: indexToInsertAt)
        // Then
        XCTAssertTrue(insertedNode === nodeToInsert)
        XCTAssertTrue(uut.get(at: indexToInsertAt) === nodeToInsert)
        XCTAssertTrue(insertedNode?.prev?.value == 0)
        XCTAssertTrue(insertedNode?.next?.value == 1)
        XCTAssertTrue(uut.count == (originalListCount + 1))
    }
    
    func test_insert_beginningOfList() {
        // Given
        let originalListCount = uut.count
        let nodeToInsert = LinkedListNode<Int>(3)
        let indexToInsertAt = 0
        // When
        let insertedNode = uut.insert(node: nodeToInsert, at: indexToInsertAt)
        // Then
        XCTAssertTrue(insertedNode === nodeToInsert)
        XCTAssertTrue(uut.get(at: indexToInsertAt) === nodeToInsert)
        XCTAssertNil(insertedNode?.prev)
        XCTAssertTrue(insertedNode?.next?.value == 0)
        XCTAssertTrue(uut.count == (originalListCount + 1))
    }
    
    func test_insert_endOfList() {
        // Given
        let originalListCount = uut.count
        let nodeToInsert = LinkedListNode<Int>(3)
        let indexToInsertAt = uut.count
        // When
        let insertedNode = uut.insert(node: nodeToInsert, at: indexToInsertAt)
        // Then
        XCTAssertTrue(insertedNode === nodeToInsert)
        XCTAssertTrue(uut.tail === nodeToInsert)
        XCTAssertTrue(insertedNode?.prev?.value == 2)
        XCTAssertNil(insertedNode?.next)
        XCTAssertTrue(uut.count == (originalListCount + 1))
    }

    func test_insert_negativeIndex() {
        // Given
        let originalListCount = uut.count
        let nodeToInsert = LinkedListNode<Int>(3)
        let indexToInsertAt = -1
        // When
        let insertedNode = uut.insert(node: nodeToInsert, at: indexToInsertAt)
        // Then
        // (list should be unchanged from starting case)
        XCTAssertNil(insertedNode)
        XCTAssertTrue(uut.count == originalListCount)
    }
    
    func test_insert_indexOutOfBounds() {
        // Given
        let originalListCount = uut.count
        let nodeToInsert = LinkedListNode<Int>(3)
        let indexToInsertAt = uut.count + 1
        // When
        let insertedNode = uut.insert(node: nodeToInsert, at: indexToInsertAt)
        // Then
        XCTAssertNil(insertedNode)
        XCTAssertTrue(uut.count == originalListCount)
    }
    
    
    // ----------------- remove() --------------------- //
    
     
    func test_remove_fromOnelementList() {
        // Given
        uut = LinkedList<Int>(head: LinkedListNode<Int>(0))
        // When
        let removedNode = uut.remove(at: 0)
        // Then
        XCTAssertTrue(removedNode?.value == 0)
        XCTAssertTrue(uut.count == 0)
    }
    
    func test_remove_fromEmptyList() {
        // Given
        uut = LinkedList<Int>()
        // When
        let removedNode = uut.remove(at: 0)
        // Then
        XCTAssertNil(removedNode)
        XCTAssertTrue(uut.count == 0)
    }
    
    func test_remove_middleOfList() {
        // Given
        let indexToRemoveAt = 1
        // When
        let removedNode = uut.remove(at: indexToRemoveAt)
        // Then
        XCTAssertTrue(removedNode?.value == 1)
    }
    
    func test_remove_beginningOfList() {
        // Given
        let indexToRemoveAt = 0
        // When
        let removedNode = uut.remove(at: indexToRemoveAt)
        // Then
        XCTAssertTrue(removedNode?.value == 0)
    }
    
    func test_remove_endOfList() {
        // Given
        let indexToRemoveAt = uut.count - 1
        // When
        let removedNode = uut.remove(at: indexToRemoveAt)
        // Then
        XCTAssertTrue(removedNode?.value == 2)
    }

    func test_remove_negativeIndex() {
        // Given
        let indexToRemoveAt = -1
        // When
        let removedNode = uut.remove(at: indexToRemoveAt)
        // Then
        XCTAssertNil(removedNode)
    }
    
    func test_remove_indexOutOfBounds() {
        // Given
        let indexToRemoveAt = uut.count
        // When
        let removedNode = uut.remove(at: indexToRemoveAt)
        // Then
        XCTAssertNil(removedNode)
    }
    
     
    // ----------------- remove() --------------------- //
     
    func test_removeTail_fromOnelementList() {
        // Given
        uut = LinkedList<Int>(head: LinkedListNode<Int>(0))
        // When
        let removedNode = uut.removeTail()
        // Then
        XCTAssertTrue(removedNode?.value == 0)
        XCTAssertTrue(uut.count == 0)
    }
     
    func test_removeTail_fromThreeElementList() {
        // Given
        let originalListCount = uut.count
        // When
        let removedNode = uut.removeTail()
        // Then
        XCTAssertTrue(removedNode?.value == 2)
        XCTAssertTrue(uut.count == (originalListCount - 1))
    }
    
    func test_removeTail_fromEmptyList() {
        // Given
        uut = LinkedList<Int>()
        // When
        let removedNode = uut.removeTail()
        // Then
        XCTAssertNil(removedNode)
        XCTAssertTrue(uut.count == 0)
    }
}
