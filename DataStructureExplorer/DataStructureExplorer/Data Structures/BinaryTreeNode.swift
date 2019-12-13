//
//  BinaryTreeNode.swift
//  DataStructureExplorer
//
//  Created by Daniel Greenheck on 11/8/19.
//  Copyright © 2019 Daniel Greenheck. All rights reserved.
//

import Foundation

/// Node of a binary tree
public class BinaryTreeNode<T> {
    /// The value of the node
    public var value: T
    /// The left child of this node
    public var left: BinaryTreeNode<T>?
    /// The right child of this node
    public var right: BinaryTreeNode<T>?
    
    /// Create instance of binary tree node with the given value
    public init(_ value: T) {
        self.value = value
    }
    
    /// Returns true if the node has no children
    public func isLeaf() -> Bool {
        return (left == nil) && (right == nil)
    }
    
    /// Performs in-order traversal on the node
    /// - parameter node:The binary tree node to perform the traversal on
    /// - parameter f:A function to be evaluated when a node is reached in the traversal
    /// If node is a binary search tree, nodes will be visited in ascending order.
    public func inOrderTraversal(_ node: BinaryTreeNode<T>?, _ f: (BinaryTreeNode<T>) -> Void) {
        guard let node = node else { return }
        inOrderTraversal(node.left, f)
        f(node)
        inOrderTraversal(node.right, f)
    }
    
    /// Performs pre-order traversal on the node
    /// - parameter node:The binary tree node to perform the traversal on
    /// - parameter f:A function to be evaluated when a node is reached in the traversal
    public func preOrderTraversal(_ node: BinaryTreeNode<T>?, _ f: (BinaryTreeNode<T>) -> Void) {
        guard let node = node else { return }
        f(node)
        inOrderTraversal(node.left, f)
        inOrderTraversal(node.right, f)
    }
    
    /// Performs post-order traversal on the node
    /// - parameter node:The binary tree node to perform the traversal on
    /// - parameter f:A function to be evaluated when a node is reached in the traversal
    public func postOrderTraversal(_ node: BinaryTreeNode<T>?, _ f: (BinaryTreeNode<T>) -> Void) {
        guard let node = node else { return }
        inOrderTraversal(node.left, f)
        inOrderTraversal(node.right, f)
        f(node)
    }
}
