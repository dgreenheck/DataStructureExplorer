//
//  Stack.swift
//  DataStructureExplorer
//
//  This class implements a stack data structure
//
//  Created by Daniel Greenheck on 10/31/19.
//  Copyright © 2019 Daniel Greenheck. All rights reserved.
//

import Foundation

/// A stack data structure which stores data in LIFO (last-in, first-out) ordering
public class Stack<T> {
    /// A node in a stack
    private class StackNode<T> {
        /// The value of the node
        var value: T
        /// The next node in the stack
        var next: StackNode<T>?
        
        /// Initializes a stack node with the specified value
        ///
        /// - parameter value: The value of the node
        init(_ value: T) {
            self.value = value
        }
    }
    
    /// The top node in the stack
    private var top: StackNode<T>?
    /// Internal counter for number of items in stack
    private var _count: Int = 0
    public var count: Int {
        get {
            return self._count
        }
    }
    
    /// Push a value onto the top of the stack
    ///
    /// - parameter value: The value to push onto the stack
    public func push(_ value: T) {
        let newTopNode = StackNode<T>(value)
        
        // Stack is empty
        if self.top == nil {
            self.top = newTopNode
        }
        else {
            // Insert node at top of stack
            newTopNode.next = self.top
            self.top = newTopNode
        }
        
        self._count += 1
    }
    
    /// Pop a value off the top of the stack.
    ///
    /// - returns: The value on the top of the stack. If stack is empty, returns nil
    public func pop() -> T? {
        // Check if stack is empty
        guard let top = self.top else { return nil }
        
        // Get value of node on top
        let poppedValue = top.value
        // Pop off the stack and assign top to next node
        self.top = top.next
        
        self._count -= 1
         
        return poppedValue
    }
    
    /// Peeks at the value on the top of the stack without removing it.
    ///
    /// - returns: The value on the top of the stack. If stack is empty, returns nil
    public func peek() -> T? {
        // Check if stack is empty
        guard let top = self.top else { return nil }
        return top.value
    }
}

