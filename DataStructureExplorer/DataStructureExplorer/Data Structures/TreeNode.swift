//
//  BinaryTreeNode.swift
//  DataStructureExplorer
//
//  Created by Daniel Greenheck on 11/8/19.
//  Copyright © 2019 Daniel Greenheck. All rights reserved.
//

import Foundation

/// Node of a tree
public class TreeNode<T> {
    /// The value of the node
    public var value: T
    /// The children of the node
    public var children: [TreeNode<T>]
    
    /// Create instance of  tree node with the given value
    /// - parameter value: The value to store in the node
    public init(_ value: T) {
        self.value = value
        self.children = .init()
    }
}
