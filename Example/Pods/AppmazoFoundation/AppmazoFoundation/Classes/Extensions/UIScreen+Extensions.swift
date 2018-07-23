//
//  UIScreen+Extensions.swift
//  AppmazoKit
//
//  Created by James Hickman on 5/18/18.
//  Copyright © 2018 Appmazo, LLC. All rights reserved.
//

public extension UIScreen {
    /**
     Get the preferred modal width for current device.
     
     - returns: Preferred width for modal presentations.
     */
    public func modalWidth() -> CGFloat {
        let portraitWidth = min(bounds.width, bounds.height)
        if UIDevice.current.userInterfaceIdiom == .pad || portraitWidth == 414.0 {
            // iPad / iPhone 7+
            return 382.0
        } else if portraitWidth == 375.0 {
            // iPhone 7
            return 343.0
        } else {
            // iPhone 4/5
            return 288.0
        }

    }
}
