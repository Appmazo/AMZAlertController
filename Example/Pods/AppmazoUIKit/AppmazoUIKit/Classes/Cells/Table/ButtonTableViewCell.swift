//
//  ButtonTableViewCell.swift
//  AppmazoKit
//
//  Created by James Hickman on 6/12/18.
//  Copyright © 2018 Appmazo, LLC. All rights reserved.
//

import UIKit

public protocol ButtonTableViewCellDelegate: class {
    func buttonTableViewCell(_ buttonTableViewCell: ButtonTableViewCell, buttonPressed: Button)
}

public class ButtonTableViewCell: UITableViewCell {
    public weak var delegate: ButtonTableViewCellDelegate?
    public let button = Button(style: .filled)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        button.setTitle("Click Me", for: .normal)
        button.backgroundColor = UIColor(red: 218.0/255.0, green: 67.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        button.cornerRadius = 4.0
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        contentView.addSubview(button)
        
        let views: [String : UIView] = ["button" : button]
        
        for (_, view) in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "|-16-[button]-16-|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[button(50)]-|", options: [], metrics: nil, views: views))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @objc private func buttonPressed(_ sender: Button) {
        delegate?.buttonTableViewCell(self, buttonPressed: sender)
    }
}
