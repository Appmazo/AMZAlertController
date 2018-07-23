//
//  ReuseIdentifiable.swift
//  AppmazoKit
//
//  Created by James Hickman on 5/22/18.
//  Copyright © 2018 Appmazo, LLC. All rights reserved.
//

import UIKit

public protocol ReuseIdentifiable: class {
    static var reuseIdentifier: String { get }
}

public extension ReuseIdentifiable where Self: UITableViewCell {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

public extension ReuseIdentifiable where Self: UICollectionViewCell {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
