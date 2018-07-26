//
//  ExampleTableViewController.swift
//  AppmazoKitExample
//
//  Created by James Hickman on 5/18/18.
//  Copyright © 2018 Appmazo, LLC. All rights reserved.
//

import UIKit
import AMZAlertController
import AppmazoUIKit

class ExampleTableViewController: UITableViewController {

    private enum Section: Int {
        case alerts
        case count
    }
    
    private enum Row: Int {
        case singleButton
        case doubleButtonWithImage
        case tripleButton
        case blurredBackground
        case clearBackground
        case clearBackgroundWithShadow
        case handler
        case square
        case custom
        case count
    }
    
    // MARK: - UITableViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ""
        navigationItem.titleView = UIImageView(image: UIImage(named: "logo-appmazo"))

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)
    }
    
    // MARK: - AMZAlertControllerTableViewController
    
    private func titleForRowAtIndexPath(_ indexPath: IndexPath) -> String? {
        switch indexPath.row {
        case Row.singleButton.rawValue:
            return "Single Button"
        case Row.doubleButtonWithImage.rawValue:
            return "Double Button with Image"
        case Row.tripleButton.rawValue:
            return "Triple Button"
        case Row.blurredBackground.rawValue:
            return "Blurred Background"
        case Row.clearBackground.rawValue:
            return "Clear Background"
        case Row.clearBackgroundWithShadow.rawValue:
            return "Clear Background with Shadow"
        case Row.handler.rawValue:
            return "Alert with Button Handler"
        case Row.square.rawValue:
            return "Alert with Square Corners"
        case Row.custom.rawValue:
            return "Alert with Custom View"
        default:
            return nil
        }
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count.rawValue
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Row.count.rawValue
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = titleForRowAtIndexPath(indexPath)

        return cell
    }
    
    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var title = ""
        var image: UIImage?
        var message = ""
        var titleColor: UIColor = UIColor.appmazoDarkGray
        var showsShadow = false
        var cornerRadius: CGFloat = 4.0
        var alertActions = [AMZAlertAction]()
        var messageColor: UIColor = UIColor.appmazoDarkGray
        var backgroundColor: UIColor = UIColor.white
        var modalBackgroundStyle: ModalTransitioning.BackgroundStyle = .transparent
        
        switch indexPath.row {
        case Row.singleButton.rawValue:
            title = "Single Button Alert"
            message = "This is a simple alert that gives the user a single CTA."
            alertActions.append(AMZAlertAction(withTitle: "Dismiss", style: .filled, handler: nil))
        case Row.doubleButtonWithImage.rawValue:
            image = UIImage(named: "icon-radioactive")
            title = "Double Button with Image Alert"
            message = "This alert has an image and two CTAs with different styles."
            alertActions.append(AMZAlertAction(withTitle: "Destruct", style: .filled, handler: nil))
            alertActions.append(AMZAlertAction(withTitle: "Dismiss", style: .normal, handler: nil))
        case Row.tripleButton.rawValue:
            title = "Triple Button Alert"
            message = "This alert has three CTAs with different styles."
            let coloredAMZAlertAction = AMZAlertAction(withTitle: "Whoa!", style: .filled, handler: nil)
            coloredAMZAlertAction.color = UIColor.appmazoDarkOrange
            alertActions.append(coloredAMZAlertAction)
            alertActions.append(AMZAlertAction(withTitle: "Neato!", style: .hollow, handler: nil))
            alertActions.append(AMZAlertAction(withTitle: "Dismiss", style: .normal, handler: nil))
        case Row.blurredBackground.rawValue:
            modalBackgroundStyle = .blurred
            title = "Alert with Blurred Background"
            message = "This is a simple alert that gives the user a single CTA with a blurred background."
            backgroundColor = UIColor.appmazoDarkGray
            titleColor = UIColor.white
            messageColor = UIColor.white
            let coloredAMZAlertAction = AMZAlertAction(withTitle: "Dismiss", style: .hollow, handler: nil)
            coloredAMZAlertAction.color = UIColor.appmazoDarkOrange
            coloredAMZAlertAction.titleColor = UIColor.appmazoDarkOrange
            alertActions.append(coloredAMZAlertAction)
        case Row.clearBackground.rawValue:
            modalBackgroundStyle = .clear
            image = UIImage(named: "icon-radioactive")
            title = "Alert with Clear Background"
            message = "This alert has an image and two CTAs with different styles with a clear background and shadow."
            backgroundColor = UIColor.appmazoDarkGray
            titleColor = UIColor.white
            messageColor = UIColor.white
            let coloredAMZAlertAction = AMZAlertAction(withTitle: "Whoa!", style: .filled, handler: nil)
            coloredAMZAlertAction.color = UIColor.white
            coloredAMZAlertAction.titleColor = UIColor.appmazoDarkGray
            alertActions.append(coloredAMZAlertAction)
        case Row.clearBackgroundWithShadow.rawValue:
            modalBackgroundStyle = .clear
            image = UIImage(named: "icon-radioactive")
            title = "Alert with Clear Background and Shadow"
            message = "This alert has an image and two CTAs with different styles with a clear background and shadow."
            backgroundColor = UIColor.appmazoDarkGray
            titleColor = UIColor.white
            messageColor = UIColor.white
            showsShadow = true
            let coloredAMZAlertAction = AMZAlertAction(withTitle: "Whoa!", style: .filled, handler: nil)
            coloredAMZAlertAction.color = UIColor.white
            coloredAMZAlertAction.titleColor = UIColor.appmazoDarkGray
            alertActions.append(coloredAMZAlertAction)
        case Row.handler.rawValue:
            title = "Alert with Button Handler"
            message = "This alert will use a button handler to show another alert."
            alertActions.append(AMZAlertAction(withTitle: "Show Alert", style: .filled, handler: { (alertAction) in
                let handlerAlertController = AMZAlertController.alertControllerWithTitle("Ta-Da!", message: "That was easy...")
                handlerAlertController.addAction(AMZAlertAction(withTitle: "Dismiss", style: .filled, handler: nil))
                self.present(handlerAlertController, animated: true, completion: nil)
            }))
        case Row.square.rawValue:
            title = "Alert with Square Corners"
            message = "This alert is your classic squared alert."
            cornerRadius = 0.0
            alertActions.append(AMZAlertAction(withTitle: "Stay Classy!", style: .filled, handler: nil))
        case Row.custom.rawValue:
            let alertController = AMZAlertController.alertControllerWithCustomView(CustomAlertView())
            alertController.addAction(AMZAlertAction(withTitle: "Dismiss", style: .filled, handler: nil))
            present(alertController, animated: true, completion: nil)
            return
        default:
            break
        }
        
        let alertController = AMZAlertController.alertControllerWithTitle(title, message: message)
        alertController.backgroundColor = backgroundColor
        alertController.titleLabel.textColor = titleColor
        alertController.messageLabel.textColor = messageColor
        alertController.cornerRadius = cornerRadius
        alertController.image = image
        alertController.showsShadow = showsShadow
        alertController.addActions(alertActions)
        alertController.modalBackgroundStyle = modalBackgroundStyle
        present(alertController, animated: true, completion: nil)
    }
}
