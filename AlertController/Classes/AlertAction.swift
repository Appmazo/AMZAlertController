//
//  AlertAction.swift
//  AlertController
//
//  Created by James Hickman on 7/22/18.
//

import AppmazoUIKit

protocol AlertActionDelegate: AnyObject {
    func alertActionPressed(_ alertAction: AlertAction)
}

public class AlertAction: Button {
    var handler: ((AlertAction) -> Void)?
    weak var delegate: AlertActionDelegate?
    
    // MARK: - Init
    
    /**
     Initialize an AlertAction.
     
     - parameters:
        - title: The title for the action.
        - style: The style for the action.
        - handler: The handler for the action's click behavior.
     */
    public init(withTitle title: String, style: AlertAction.Style, handler: ((AlertAction) -> Void)?) {
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

    // MARK: - AlertAction
    
    /**
     Creates an Alert Action.
     
     - parameters:
        - title: The title for the action.
        - style: The style for the action.
        - handler: The handler for the action's click behavior.
     - returns: A new instance of an AlertAction.
     */
    public class func actionWithTitle(_ title: String, style: AlertAction.Style, handler: ((AlertAction) -> Void)?) -> AlertAction {
        return AlertAction(withTitle: title, style: style, handler: handler)
    }
    
    @objc private func actionPressed(_ sender: AlertAction) {
        delegate?.alertActionPressed(self)
    }
}
