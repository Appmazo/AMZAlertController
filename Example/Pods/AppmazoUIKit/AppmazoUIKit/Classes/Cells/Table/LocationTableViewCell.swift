//
//  LocationTableViewCell.swift
//  AppmazoKit
//
//  Created by James Hickman on 5/12/18.
//  Copyright © 2018 Appmazo, LLC. All rights reserved.
//

import UIKit

public protocol LocationTableViewCellDelegate: NSObjectProtocol {
    func locationTableViewCell(_ locationTableViewCell: LocationTableViewCell, locationButtonPressed locationButton: Button)
    func locationTableViewCell(_ locationTableViewCell: LocationTableViewCell, locationTextUpdated locationText:String?)
}

public class LocationTableViewCell: UITableViewCell {
    public enum LocationTableViewCellState {
        case userLocation
        case customLocation
        case editingLocation
        case loading
    }
    
    public static let reuseIdentifier = "LocationTableViewCellReuseIdentifier"
    public weak var delegate: LocationTableViewCellDelegate?
    
    private let textField = UITextField()
    private let primaryButton = Button(style: .normal)
    private let activtyIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    private var editingConstraints: [NSLayoutConstraint]!
    private var loadingConstraints: [NSLayoutConstraint]!
    private var changeButtonConstraints: [NSLayoutConstraint]!
    private var updateLocationButtonConstraints: [NSLayoutConstraint]!
    
    public var state: LocationTableViewCellState = .loading {
        didSet {
            updateState(state)
        }
    }
    
    public var locationText: String? {
        didSet {
            textField.text = locationText
        }
    }
    
    // MARK: - Init
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        textField.delegate = self
        textField.borderStyle = .none
        textField.placeholder = "Enter Address, City, or Postal Code"
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.autocorrectionType = .no
        textField.adjustsFontSizeToFitWidth = true
        textField.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal)
        contentView.addSubview(textField)
        
        primaryButton.isHidden = true
        primaryButton.titleLabel?.textAlignment = .right
        primaryButton.imageView?.tintColor = UIColor.darkGray
        primaryButton.imageView?.contentMode = .scaleAspectFit
        primaryButton.setTitleColor(UIColor.blue, for: .normal)
        primaryButton.addTarget(self, action: #selector(primaryButtonPressed(_:)), for: .touchUpInside)
        contentView.addSubview(primaryButton)
        
        activtyIndicatorView.hidesWhenStopped = true
        contentView.addSubview(activtyIndicatorView)
        
        let views: [String : UIView] = [ "activtyIndicatorView": activtyIndicatorView,
                                         "textField": textField,
                                         "primaryButton": primaryButton ]
        for (_, view) in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        editingConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|-[textField]-|", options: [], metrics: nil, views: views)
        loadingConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|-[activtyIndicatorView(30)]-[textField]-|", options: [.alignAllCenterY], metrics: nil, views: views)
        changeButtonConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|-[textField]-[primaryButton(80)]-16-|", options: [.alignAllCenterY], metrics: nil, views: views)
        updateLocationButtonConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|-[textField]-[primaryButton(25)]-16-|", options: [.alignAllCenterY], metrics: nil, views: views)
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[activtyIndicatorView(30)]", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[primaryButton(25)]", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[textField]-|", options: [], metrics: nil, views: views))
        
        updateState(.loading)
    }
    
    // MARK: - PDLocationAddressTableViewCell
    
    private func updateState(_ state: LocationTableViewCellState) {
        if state != .loading {
            hideLoadingIndicator()
        }
        
        removeConstraints(editingConstraints)
        removeConstraints(loadingConstraints)
        removeConstraints(changeButtonConstraints)
        removeConstraints(updateLocationButtonConstraints)

        switch state {
        case .userLocation:
            addConstraints(updateLocationButtonConstraints)
            textField.isUserInteractionEnabled = false
            showLocationButton()
            break
        case .customLocation:
            addConstraints(changeButtonConstraints)
            if textField.text?.count == 0 {
                textField.isUserInteractionEnabled = true
            } else {
                textField.isUserInteractionEnabled = false
                showChangeButton()
            }
            break
        case .editingLocation:
            primaryButton.isHidden = true
            addConstraints(editingConstraints)
            textField.isUserInteractionEnabled = true
            startEditing()
            break
        case .loading:
            primaryButton.isHidden = true
            addConstraints(loadingConstraints)
            locationText = "Updating your location..."
            textField.isUserInteractionEnabled = false
            showLoadingIndicator()
            break
        }
    }
    
    private func showLoadingIndicator() {
        activtyIndicatorView.startAnimating()
    }
    
    private func hideLoadingIndicator() {
        activtyIndicatorView.stopAnimating()
    }
    
    private func showLocationButton() {
        primaryButton.setImage(UIImage(named: "icon-pin", in: Bundle(for: LocationTableViewCell.self), compatibleWith: nil), for: .normal)
        primaryButton.setTitle(nil, for: .normal)
        primaryButton.isHidden = false
    }
    
    private func showChangeButton() {
        primaryButton.setImage(nil, for: .normal)
        primaryButton.setTitle("Change", for: .normal)
        primaryButton.isHidden = false
    }
    
    private func startEditing() {
        textField.becomeFirstResponder()
    }
    
    private func stopEditing() {
        textField.resignFirstResponder()
    }
    
    @objc func primaryButtonPressed(_ sender: Button) {
        switch state {
        case .customLocation:
            state = .editingLocation
            break
        case .editingLocation:
            state = .customLocation
            break
        case .userLocation:
            delegate?.locationTableViewCell(self, locationButtonPressed: sender)
            break
        case .loading:
            // no-op
            break
        }
    }
}

extension LocationTableViewCell: UITextFieldDelegate {
    public func textFieldDidEndEditing(_ sender: UITextField) {
        delegate?.locationTableViewCell(self, locationTextUpdated: sender.text)
        state = .customLocation
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
