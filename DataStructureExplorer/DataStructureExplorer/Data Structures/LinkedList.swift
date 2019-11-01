//
//  LinkedList.swift
//  DataStructureExplorer
//
//  This class implements a non-circular, doubly-linked list. Each
//  node maintains a reference to the node preceding it and the node
//  following it.
//
//  Created by Daniel Greenheck on 10/31/19.
//  Copyright © 2019 Daniel Greenheck. All rights reserved.
//

import Foundation

/// A doubly-linked list
public class LinkedList<T> {
    /// The last element in the list. If list is empty, value of member is nil.
    public var head: LinkedListNode<T>?
    /// The last element in the list. If list is empty, value of member is nil.
    public var tail: LinkedListNode<T>?
    /// Internal variable for number of elements in the list
    private var _count: Int = 0
    /// Number of elements in the list
    public var count: Int {
        get {
            return _count
        }
    }
    
    /// Creates an empty linked list
    init() {
        
    }
    
    /// Creates an linked list with the given node as the head node.
    ///
    /// - parameter head: The node to use as the head node of the list.
    init(head: LinkedListNode<T>) {
        _ = self.append(head)
    }
    
    /// Clears all nodes in the list
    public func clear() {
        // Clear references to head and tail nodes
        self.head = nil
        self.tail = nil
        
        self._count = 0
    }
    
    /// Appends a node to the end of the linked list
    ///
    /// - parameter node: The node to append
    /// - returns: The appended node
    ///
    /// Time Complexity: O(1)
    public func append(_ node: LinkedListNode<T>) -> LinkedListNode<T> {
        // Is list empty?
        if self.count == 0 {
            self.head = node
            self.tail = node
            self._count = 1
        }
        else {
            if let oldTail = self.tail {
                self.tail = node
                
                // Update references
                oldTail.next = node
                node.prev = oldTail
                node.next = nil
                
                self._count += 1
            }
        }
        
        return node
    }
    
    /// Returns the node at the specified index. If index is out of bounds, returns nil.
    ///
    /// - parameter at: The index of the node to retrieve.
    /// - returns: LinkedListNode<T> at the specified index. If index out of bounds, returns nil.
    ///
    /// Time Complexity
    ///  - index == 0 : O(1)
    ///  - index == (size-1) : O(1)
    ///  - else :  O(N)
    public func get(at index: Int) -> LinkedListNode<T>? {
        // Verify index is non-negative
        guard (index >= 0) else { return nil }
        // Verify index is in bounds
        guard (index < self.count) else { return nil }
        
        // Direct access to head node [O(1)]
        var node: LinkedListNode<T>?
        if index == 0 {
            node = self.head
        }
        // Direct access to tail node [O(1)]
        else if index == (self.count - 1) {
            node = self.tail
        }
        // Otherwise iterate through nodes until index is reached [O(N)]
        else {
            node = self.head
            for _ in 1...index {
                node = node?.next
            }
        }
        
        return node
    }
    
    /// Insert the node at the specified index.
    ///
    /// - parameter node: The node to insert in the list
    /// - parameter at: The index to insert the node at
    /// - returns: The inserted node if the insertion was successful. Otherwise, returns nil.
    ///
    /// Time Complexity
    ///  - index == 0 : O(1)
    ///  - index == (size-1) : O(1)
    ///  - else :  O(N)
    public func insert(node: LinkedListNode<T>, at index: Int)  -> LinkedListNode<T>? {
        // Verify index is non-negative
        guard (index >= 0) else { return nil }
        // Verify index is in bounds
        guard (index <= self.count) else { return nil }
        
        // Direct access to head node
        var insertedNode: LinkedListNode<T>? = nil
        if index == 0 {
            let oldHead = self.head
            self.head = node
            node.prev = nil
            node.next = oldHead
            oldHead?.prev = node
            
            insertedNode = node
            self._count += 1
        }
        // Direct access to tail node
        else if index == self.count {
            // Identical to append
            insertedNode = self.append(node)
        }
        else {
            // Get the existing node at that index
            if let existingNode = self.get(at: index) {
                node.prev = existingNode.prev
                existingNode.prev?.next = node
                existingNode.prev = node
                node.next = existingNode
                
                insertedNode = node
                self._count += 1
            }
        }
        
        return insertedNode
    }
    
    /// Removes a node at the given index.
    ///
    /// - parameter at: The index to remove at
    /// - returns:The node at the given index. If the index is out of bounds, returns nil.
    ///
    /// Time Complexity
    ///  - index == 0 : O(1)
    ///  - index == (size-1) : O(1)
    ///  - else :  O(N)
    public func remove(at index: Int) -> LinkedListNode<T>? {
        // Verify index is non-negative
        guard (index >= 0) else { return nil }
        // Verify index is in bounds
        guard (index < self.count) else { return nil }
        
        var removedNode: LinkedListNode<T>? = nil
        if let nodeToRemove = self.get(at: index) {
            // Only one item in the list
            if self.count == 1 {
                self.head = nil
                self.tail = nil
            }
            // First item in the list
            else if nodeToRemove.next != nil && nodeToRemove.prev == nil {
                nodeToRemove.next?.prev = nil
            }
            // Last node in the list
            else if nodeToRemove.next == nil && nodeToRemove.prev != nil {
                // Penultimate node now points to nothing
                nodeToRemove.prev?.next = nil
            }
            // Middle of the list
            else {
                if let prevNode = nodeToRemove.prev, let nextNode = nodeToRemove.next {
                    prevNode.next = nextNode
                    nextNode.prev = prevNode
                }
            }
            
            removedNode = nodeToRemove
            self._count -= 1
        }
        
        return removedNode
    }
    
    /// Removes the last node in the linked list
    ///
    /// - returns: The last node in the list. If list is empty, returns nil
    public func removeTail() -> LinkedListNode<T>? {
        // Check if list is empty
        guard self.count > 0 else { return nil }
        
        var removedNode: LinkedListNode<T>? = nil
        if let tail = self.tail {
            removedNode = tail
            
            // Is there only one item in the list?
            if self.count == 1 {
                self.head = nil
                self.tail = nil
                
                self._count = 0
            }
            else {
                // Second to last node becomes new tail
                if let secondToLastNode = tail.prev {
                    secondToLastNode.next = nil
                    self.tail = secondToLastNode
                    
                    self._count -= 1
                }
            }
        }

        return removedNode
    }
}

/// A linked list node
public class LinkedListNode<T> {
    /// The value of the node
    public var value: T
    /// Pointer to the next item in the linked list. If this is the last item in the list, this value is nil.
    public var next: LinkedListNode<T>?
    /// Pointer to the previous item in the linked list. If this is the first item in the list, this value is nil.
    public var prev: LinkedListNode<T>?
    
    /// Instantiate a linked list node with the given value and value type.
    ///
    /// - parameter value: The value of the linked list node.
    public init(_ value: T) {
        self.value = value
    }
}
