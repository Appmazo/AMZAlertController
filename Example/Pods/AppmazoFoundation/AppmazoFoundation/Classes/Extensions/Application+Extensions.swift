//
//  Application+Extensions.swift
//  AppmazoFoundation
//
//  Created by James Hickman on 1/11/17.
//  Copyright © 2017 Appmazo LLC. All rights reserved.
//

import UIKit
import Foundation

public extension UIApplication {
    public class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        
        return controller
    }
}
