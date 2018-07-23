//
//  SubtitleTableViewCell.swift
//  AppmazoKit
//
//  Created by James Hickman on 5/22/18.
//  Copyright © 2018 Appmazo, LLC. All rights reserved.
//

import UIKit

public class SubtitleTableViewCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
