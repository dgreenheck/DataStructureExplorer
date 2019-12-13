//
//  BinaryTree.swift
//  DataStructureExplorerTests
//
//  Created by Daniel Greenheck on 11/8/19.
//  Copyright © 2019 Daniel Greenheck. All rights reserved.
//

import XCTest

class BinaryTreeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //  ------------------- BinaryTreeNode Tests -------------------- //
    func test_isTerminal_true() {
        // Given
        let node = BinaryTreeNode<Int>(0)
        node.left = nil
        node.right = nil
        // Then
        XCTAssert(node.isLeaf())
    }
    
    func test_isTerminal_leftChild() {
        // Given
        let node = BinaryTreeNode<Int>(0)
        node.left = BinaryTreeNode<Int>(1)
        node.right = nil
        // Then
        XCTAssertFalse(node.isLeaf())
    }
    
    func test_isTerminal_rightChild() {
        // Given
        let node = BinaryTreeNode<Int>(0)
        node.left = nil
        node.right = BinaryTreeNode<Int>(1)
        // Then
        XCTAssertFalse(node.isLeaf())
    }

   func test_isTerminal_leftAndRightChildren() {
       // Given
       let node = BinaryTreeNode<Int>(0)
       node.left = BinaryTreeNode<Int>(2)
       node.right = BinaryTreeNode<Int>(1)
       // Then
       XCTAssertFalse(node.isLeaf())
   }
}
