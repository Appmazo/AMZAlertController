//
//  FormFieldTableViewCell.swift
//  AppmazoKit
//
//  Created by James Hickman on 6/12/18.
//  Copyright © 2018 Appmazo, LLC. All rights reserved.
//

import UIKit

public class FormFieldTableViewCell: UITableViewCell {
    private var promptLabel = UILabel()
    var containerView = UIView()
    
    public var promptText: String? {
        didSet {
            promptLabel.text = promptText
        }
    }
    
    // MARK: - Init
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        promptLabel.font = UIFont.systemFont(ofSize: 10.0, weight: .regular)
        contentView.addSubview(promptLabel)
        
        contentView.addSubview(containerView)
        
        let views: [String : UIView] = [ "containerView" : containerView,
                                         "promptLabel": promptLabel]
        
        for (_, view) in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "|-[promptLabel]-|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "|-16-[containerView]-16-|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[promptLabel][containerView]-|", options: [], metrics: nil, views: views))
    }
}
