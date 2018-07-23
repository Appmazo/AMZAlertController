//
//  QuantityFormFieldTableViewCell.swift
//  AppmazoKit
//
//  Created by James Hickman on 6/12/18.
//  Copyright © 2018 Appmazo, LLC. All rights reserved.
//

public protocol QuantityFormFieldTableViewCellDelegate: class {
    func quantityFormFieldTableViewCell(_ quantityFormFieldTableViewCell: QuantityFormFieldTableViewCell, didFinishPickingValue value: Int)
    func quantityFormFieldTableViewCell(_ quantityFormFieldTableViewCell: QuantityFormFieldTableViewCell, didUpdateValue value: Int)
}

public extension QuantityFormFieldTableViewCellDelegate { // Optionals
    func quantityFormFieldTableViewCell(_ quantityFormFieldTableViewCell: QuantityFormFieldTableViewCell, didUpdateValue value: Int) { }
}

public class QuantityFormFieldTableViewCell: FormFieldTableViewCell, UIPickerViewDataSource, UIPickerViewDelegate {
    public weak var delegate : QuantityFormFieldTableViewCellDelegate?
    public var textField = UITextField()

    private let picker = UIPickerView()
    
    public var quantity: Int = 0 {
        didSet {
            textField.text = String(quantity)
        }
    }
    
    public var quantityRange: ClosedRange<Int> = 1...100 {
        didSet {
            picker.reloadAllComponents()
        }
    }
    
    // MARK: - Init
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        picker.delegate = self
        picker.backgroundColor = UIColor.groupTableViewBackground
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        
        let spaceBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBarButtonItemPressed(_:)))
        toolBar.setItems([spaceBarButtonItem, doneBarButtonItem], animated: false)
        
        textField.inputView = picker
        textField.placeholder = "DATE"
        textField.borderStyle = .none
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.autocorrectionType = .no
        textField.inputAccessoryView = toolBar
        textField.adjustsFontSizeToFitWidth = true
        containerView.fillWithSubview(textField)
    }
    
    // MARK: - QuantityFormFieldTableViewCell
    
    @objc private func doneBarButtonItemPressed(_ sender: UIBarButtonItem) {
        endEditing(true)
        delegate?.quantityFormFieldTableViewCell(self, didFinishPickingValue: quantityRange.lowerBound + picker.selectedRow(inComponent: 0))
    }
    
    // MARK: - UIPickerViewDataSource
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return quantityRange.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(quantityRange.lowerBound + row)
    }
    
    // MARK: - UIPickerViewDelegate
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        quantity = quantityRange.lowerBound + row
        delegate?.quantityFormFieldTableViewCell(self, didUpdateValue: row)
    }
}
