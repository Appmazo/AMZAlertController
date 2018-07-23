//
//  DateFormFieldTableViewCell.swift
//  AppmazoKit
//
//  Created by James Hickman on 6/12/18.
//  Copyright © 2018 Appmazo, LLC. All rights reserved.
//

import UIKit
import AppmazoFoundation

public protocol DateFormFieldTableViewCellDelegate: class {
    func dateFormFieldTableViewCell(_ dateFormFieldTableViewCell: DateFormFieldTableViewCell, didFinishPickingDate date: Date?)
    func dateFormFieldTableViewCell(_ dateFormFieldTableViewCell: DateFormFieldTableViewCell, didChangeDate date: Date?) // Optional
}

public extension DateFormFieldTableViewCellDelegate {
    func datePickerTableViewCell(_ datePickerTableViewCell: DatePickerTableViewCell, didChangeDate date: Date?) { }
}

public class DateFormFieldTableViewCell: FormFieldTableViewCell {
    public weak var delegate : DateFormFieldTableViewCellDelegate?
    public var textField = UITextField()

    private let datePicker = UIDatePicker()

    public var date: Date? {
        didSet {
            textField.text = date?.convertToString()
            if let date = date {
                datePicker.date = date
            }
        }
    }
    
    // MARK: - Init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        datePicker.backgroundColor = UIColor.groupTableViewBackground
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        
        let spaceBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBarButtonItemPressed(_:)))
        toolBar.setItems([spaceBarButtonItem, doneBarButtonItem], animated: false)
        
        textField.inputView = datePicker
        textField.placeholder = "DATE"
        textField.borderStyle = .none
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.autocorrectionType = .no
        textField.inputAccessoryView = toolBar
        textField.adjustsFontSizeToFitWidth = true
        containerView.fillWithSubview(textField)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - DateFormFieldTableViewCell
    
    @objc private func doneBarButtonItemPressed(_ sender: UIBarButtonItem) {
        endEditing(true)
        delegate?.dateFormFieldTableViewCell(self, didFinishPickingDate: date)
    }
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        date = sender.date
        delegate?.dateFormFieldTableViewCell(self, didChangeDate: date)
    }
}
