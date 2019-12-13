//
//  MinHeap.swift
//  DataStructureExplorer
//
//  Created by Daniel Greenheck on 11/8/19.
//  Copyright © 2019 Daniel Greenheck. All rights reserved.
//

import Foundation

public class MinHeap<T: Comparable> {
    /// An array containing the elements in the heap
    private var heap: [T?]
    /// Pointer to the last element in the tree
    private var last: Int = -1
    /// The number of items in the heap
    public var count: Int {
        get {
            return self.last + 1
        }
    }
    
    public init() {
        // Initialize heap with empty root node
        self.heap = [nil]
    }
    
    public init(_ values: [T]) {
        // Initialize heap with empty root node
        self.heap = [nil]
        // Insert values into heap one by one
        for v in values {
            self.insert(v)
        }
    }
    
    /// Inserts the value into the heap
    /// - parameter value:The value to insert
    public func insert(_ value: T) {
        self.last += 1
        // If level of tree is filled, resize to create a new level
        if self.last >= self.heap.count {
            self.heap.reserveCapacity(2*self.heap.count)
            for _ in 0..<self.heap.count {
                self.heap.append(nil)
            }
        }
        // Add value to the bottom of the tree
        self.heap[self.last] = value
        // Perform "bubble-up" operation to get value in correct spot
        self.heapifyUp(value, self.last)
    }
    
    /// Removes the top element from the heap
    public func remove() -> T? {
        guard self.count > 0 else { return nil }
        
        // Store off minimum to be returned later
        let min = self.min()
        
        if self.count == 1 {
            self.heap[0] = nil
            self.last = -1
        }
        else {
            // Move last node into the root
            self.heap[0] = self.heap[self.last]
            self.heap[self.last] = nil
            self.last -= 1
            // Bubble root node down to the correct spot
            if let rootValue = self.heap[0] {
                self.heapifyDown(rootValue, 0)
            }
        }
        return min
    }
    
    /// Moves an element in the heap up to the correct location
    private func heapifyUp(_ value: T, _ index: Int) {
        // At root node, can't go any higher
        guard index > 0 else { return }
        
        let parentIndex = self.parentOf(index)
        if let parent = self.heap[parentIndex] {
            // If value is less than parent, swap the two
            if value < parent {
                self.heap[index] = parent
                self.heap[parentIndex] = value
                self.heapifyUp(value, parentIndex)
            }
        }
    }
    
    /// Moves an element in the heap down to the correct location
    private func heapifyDown(_ value: T, _ index: Int) {
        // At last node, can't go any higher
        guard index < self.count else { return }
        
        // Indices for left and right child nodes
        let leftIndex = self.leftOf(index)
        let rightIndex = self.rightOf(index)
        
        // If this node is greater than its left child node, swap the two
        if leftIndex < self.last, let left = self.heap[leftIndex] {
            if value > left {
                self.heap[index] = left
                self.heap[leftIndex] = value
                self.heapifyDown(value, leftIndex)
            }
        }
        // If this node is greater than its right child node, swap the two
        else if rightIndex < self.last, let right = self.heap[rightIndex] {
            if value > right {
                self.heap[index] = right
                self.heap[rightIndex] = value
                self.heapifyDown(value, rightIndex)
            }
        }
    }
    
    /// Returns the index for the left child node of the node at given index
    private func leftOf(_ index: Int) -> Int {
        return (index*2)+1
    }
    
    /// Returns the index of the right child node of the node at given index
    private func rightOf(_ index: Int) -> Int {
        return (index*2)+2
    }
    
    /// Returns the index of the parent node of the node at the given index
    private func parentOf(_ index: Int) -> Int {
        return (index-1)/2
    }
    
    /// Extracts the minimum value in the heap
    public func min() -> T? {
        return heap[0]
    }
}
