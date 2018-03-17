//
//  ArrayExtensions.swift
//  Bog Assignment
//
//  Created by nikoloz on 17.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

// MARK: - Methods
public extension Array {
    
    /// SwifterSwift: Element at the given index if it exists.
    ///
    /// - Parameter index: index of element.
    /// - Returns: optional element (if exists).
    public func item(at index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }
    
    /// SwifterSwift: First index of a given item in an array.
    ///
    /// - Parameter item: item to check.
    /// - Returns: first index of item in array (if exists).
    public func firstIndex <Item: Equatable> (of item: Item) -> Int? {
        if item is Element {
            for (index, value) in self.lazy.enumerated() {
                if value as! Item == item {
                    return index
                }
            }
            return nil
        }
        return nil
    }
    
    /// SwifterSwift: Last index of element in array.
    ///
    /// - Parameter item: item to check.
    /// - Returns: last index of item in array (if exists).
    public func lastIndex <Item: Equatable> (of item: Item) -> Int? {
        if item is Element {
            for (index, value) in self.reversed().lazy.enumerated() {
                if value as! Item == item {
                    return count - 1 - index
                }
            }
            return nil
        }
        return nil
    }
    
    /// SwifterSwift: Remove last element from array and return it.
    ///
    /// - Returns: last elemets in array (if applicable).
    @discardableResult public mutating func pop() -> Element? {
        guard self.count > 0 else {
            return nil
        }
        return removeLast()
    }
    
    /// SwifterSwift: Insert an element at the beginning of array.
    ///
    /// - Parameter newElement: element to insert.
    public mutating func prepend(_ newElement: Element) {
        self.insert(newElement, at: 0)
    }
    
    /// SwifterSwift: Insert an element to the end of array.
    ///
    /// - Parameter newElement: element to insert.
    public mutating func push(_ newElement: Element) {
        return append(newElement)
    }
    
    /// SwifterSwift: Shuffle array.
    public mutating func shuffle() {
        // https://gist.github.com/ijoshsmith/5e3c7d8c2099a3fe8dc3
        for _ in 0..<10 {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
    
}
