//
//  File.swift
//  
//
//  Created by Mohamed Aberkane on 12/02/2021.
//

import Foundation

public extension String {
    
    func toDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> Date? {
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
    
    var nilIfEmpty: String? {
        self.isEmpty ? nil : self
    }
    
    var toInt: Int? {
        Int(self)
    }
    
    var boolValue: Bool {
        (self as NSString).boolValue
    }
}
