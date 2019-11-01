//
//  Queue.swift
//  DataStructureExplorer
//
//  This class implements a FIFO queue
//
//  Created by Daniel Greenheck on 11/1/19.
//  Copyright © 2019 Daniel Greenheck. All rights reserved.
//

import Foundation

///  Represents a sequence of values with first-in, first-out (FIFO) ordering.
public class Queue<T> {
    /// A node in the queue
    private class QueueNode<T> {
        /// The value of the node
        var value: T
        /// The next node in the queue
        var next: QueueNode<T>?
        
        /// Initialize a queue node
        ///
        /// - parameter value: Initial value of the node
        init(_ value: T) {
            self.value = value
        }
    }
    
    /// Item at the front of the queue
    private var first: QueueNode<T>?
    /// Item at the back of the queue
    private var last: QueueNode<T>?
    /// Internal member tracking number of items in the queue
    private var _count: Int = 0
    /// The number of items in the queue
    public var count: Int {
        get {
            return _count
        }
    }
    /// Returns true if the queue is empty
    public var isEmpty: Bool {
        get {
            return (self.count == 0)
        }
    }
    
    /// Places an item at the back of the queue
    ///
    /// - parameter value: The value to enqueue
    public func enqueue(_ value: T) {
        let newItem = QueueNode<T>(value)
        
        if self.isEmpty {
            self.first = newItem
            self.last = newItem
        }
        else {
            // Place item at back of queue
            self.last?.next = newItem
            self.last = newItem
        }
        
        self._count += 1
    }
    
    /// Removes and returns the item from the front of the queue
    ///
    /// - returns: Item at the front of the queue
    public func dequeue() -> T? {
        
        var dequeuedValue: T? = nil
        if !self.isEmpty {
            dequeuedValue = self.first?.value
            self.first = self.first?.next
            self._count -= 1
            
            if self.first == nil {
                self.last = nil
            }
        }
                
        return dequeuedValue
    }
    
    /// Returns the item at the front of the queue without removing it
    ///
    /// - returns: Item at the front of the queue
    public func peek() -> T? {
        return self.first?.value
    }
}
