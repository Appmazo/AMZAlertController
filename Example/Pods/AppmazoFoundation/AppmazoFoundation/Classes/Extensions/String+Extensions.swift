//
//  String+Extensions.swift
//  AppmazoKit
//
//  Created by James Hickman on 6/25/18.
//

import Foundation

public extension String {
    /**
     Create a camel cased string.
     
     - returns: A camel cased version of the string.
     */
    public func camelCased() -> String {
        var camelCasedString = ""
        let components = self.components(separatedBy: CharacterSet.whitespacesAndNewlines)
        for (index, string) in components.enumerated() {
            let formattedString = index == 0 ? string.lowercased() : string.lowercased().capitalized
            camelCasedString += formattedString
        }
        
        return camelCasedString
    }
    
    /**
     Create a random string for the provided length.
     
     - parameters:
       -  length: Length the genderated string should be.
     
     - returns: A randomly generated string.
     */
    public static func randomString(length: Int) -> String {
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }

}
