//
//  TextFieldTableViewCell.swift
//  AppmazoKit
//
//  Created by James Hickman on 5/22/18.
//  Copyright © 2018 Appmazo, LLC. All rights reserved.
//

import UIKit

public protocol TextFormFieldTableViewCellDelegate: class {
    func formFieldTableViewCell(_ formFieldTableViewCell: FormFieldTableViewCell, didUpdateText text: String?)
    func formFieldTableViewCellDidBeginEditing(_ formFieldTableViewCell: FormFieldTableViewCell)
    func formFieldTableViewCellDidEndEditing(_ formFieldTableViewCell: FormFieldTableViewCell)
}

public class TextFormFieldTableViewCell: FormFieldTableViewCell, UITextFieldDelegate {
    public weak var delegate : TextFormFieldTableViewCellDelegate?
    public var textField = UITextField()

    // MARK: - Init
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        textField.delegate = self
        textField.borderStyle = .none
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.autocorrectionType = .no
        textField.isUserInteractionEnabled = false
        textField.adjustsFontSizeToFitWidth = true
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        containerView.fillWithSubview(textField)
    }
    
    // MARK: - TextFormFieldTableViewCell

    @objc private func textFieldDidChange(_ sender: UITextField) {
        delegate?.formFieldTableViewCell(self, didUpdateText: sender.text)
    }

    // MARK: - UITextFieldDelegate
    
    public func textFieldDidBeginEditing(_ sender: UITextField) {
        delegate?.formFieldTableViewCellDidBeginEditing(self)
    }
    
    public func textFieldDidEndEditing(_ sender: UITextField) {
        delegate?.formFieldTableViewCellDidEndEditing(self)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
