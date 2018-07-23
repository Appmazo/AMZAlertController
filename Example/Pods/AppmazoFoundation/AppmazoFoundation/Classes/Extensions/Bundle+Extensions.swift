//
//  Bundle+Extensions.swift
//  AppmazoKit
//
//  Created by James Hickman on 6/25/18.
//

import Foundation

public extension Bundle {
    /**
     Retrieve the app's bundle display name.
     
     - returns: Returns the app bundle display name.
     */
    public class func appBundleDisplayName() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String
    }

    public class func appVersion() -> String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
}
