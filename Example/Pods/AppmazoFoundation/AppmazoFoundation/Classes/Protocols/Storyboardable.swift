//
//  Storyboardable.swift
//  AppmazoKit
//
//  Created by James Hickman on 5/18/18.
//  Copyright © 2018 Appmazo, LLC. All rights reserved.
//

import UIKit

public protocol Storyboardable: class {
    static var storyboardName: String { get }
}

public extension Storyboardable where Self: UIViewController {
    public static var storyboardName: String {
        return String(describing: self)
    }
    
    public static func viewControllerFromStoryboard(name: String = storyboardName) -> Self {
        let storyboard = UIStoryboard(name: name, bundle: Bundle(for: self))
        
        guard let vc = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("Could not instantiate initial storyboard with name: \(name)")
        }
        
        return vc
    }
}

extension UITableViewCell: ReuseIdentifiable { }
extension UICollectionViewCell: ReuseIdentifiable { }
