//
//  UIViewController+Extensions.swift
//  AppmazoFoundation
//
//  Created by James Hickman on 7/19/18.
//

import Foundation

public extension UIViewController {
    /**
        The currently visible and top most view controller.
     -returns: UIViewController
     */
    public func topMostViewController() -> UIViewController {
        if let presented = self.presentedViewController {
            return presented.topMostViewController()
        }
        if let navigation = self as? UINavigationController {
            return navigation.visibleViewController?.topMostViewController() ?? navigation
        }
        if let tab = self as? UITabBarController {
            return tab.selectedViewController?.topMostViewController() ?? tab
        }
        
        return self
    }
}
