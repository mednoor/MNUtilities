//
//  Collection+.swift
//  MNUtilities
//
//  Created by M N E H Aberkane on 02/01/2022.
//

import Foundation

public extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
