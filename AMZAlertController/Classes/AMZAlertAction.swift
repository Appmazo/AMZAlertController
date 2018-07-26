//
//  AMZAlertAction.swift
//  AMZAlertController
//
//  Created by James Hickman on 7/22/18.
//  Copyright © 2018 Appmazo, LLC. All rights reserved.
//

import AppmazoUIKit

protocol AMZAlertActionDelegate: AnyObject {
    func alertActionPressed(_ AMZAlertAction: AMZAlertAction)
}

public class AMZAlertAction: Button {
    var handler: ((AMZAlertAction) -> Void)?
    weak var delegate: AMZAlertActionDelegate?
    
    // MARK: - Init
    
    /**
     Initialize an AMZAlertAction.
     
     - parameters:
        - title: The title for the action.
        - style: The style for the action.
        - handler: The handler for the action's click behavior.
     */
    public init(withTitle title: String, style: AMZAlertAction.Style, handler: ((AMZAlertAction) -> Void)?) {
        super.init(style: style)
        
        self.handler = handler
        
        cornerRadius = 4.0
        titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .medium)
        
        setTitle(title, for: .normal)
        addTarget(self, action: #selector(actionPressed(_:)), for: .touchUpInside)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - AMZAlertAction
    
    /**
     Creates an Alert Action.
     
     - parameters:
        - title: The title for the action.
        - style: The style for the action.
        - handler: The handler for the action's click behavior.
     - returns: A new instance of an AMZAlertAction.
     */
    public class func actionWithTitle(_ title: String, style: AMZAlertAction.Style, handler: ((AMZAlertAction) -> Void)?) -> AMZAlertAction {
        return AMZAlertAction(withTitle: title, style: style, handler: handler)
    }
    
    @objc private func actionPressed(_ sender: AMZAlertAction) {
        delegate?.alertActionPressed(self)
    }
}
