//
//  String+.swift
//  MNUtilities
//
//  Created by Mohamed Aberkane on 08/02/2021.
//

import Foundation

public extension Optional {
    
    var isNil: Bool {
        self == nil
    }
    
    var isNotNil: Bool {
        self != nil
    }
}
