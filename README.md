# AlertController

[![Build Status](https://travis-ci.com/Appmazo/AlertController.svg?style=flat)](https://travis-ci.com/Appmazo/AlertController)
[![Version](https://img.shields.io/cocoapods/v/AlertController.svg?style=flat)](http://cocoapods.org/pods/AlertController.svg)
[![License](https://img.shields.io/cocoapods/l/AlertController.svg?style=flat)](http://cocoapods.org/pods/AlertController.svg)
[![Platform](https://img.shields.io/cocoapods/p/AlertController.svg?style=flat)](http://cocoapods.org/pods/AlertController.svg)
[![Beerpay](https://beerpay.io/Appmazo/AlertController/badge.svg)](https://beerpay.io/Appmazo/AlertController)
[![Beerpay](https://beerpay.io/Appmazo/AlertController/make-wish.svg?style=flat-square)](https://beerpay.io/Appmazo/AlertController?focus=wish)

# Introduction

AlertController is a simple and modern alert controller which is better than but familiar to UIAlertController.

![Alert Controller Single Button](./Screenshots/single-button.png)
![Alert Controller Double Button with Image](./Screenshots/double-button-with-image.png)
![Alert Controller Triple Button](./Screenshots/triple-button.png)
![Alert Controller Blurred Background](./Screenshots/blurred-background.png)
![Alert Controller Clear Background](./Screenshots/clear-background.png)
![Alert Controller Clear Background with Shadow](./Screenshots/clear-background-with-shadow.png)
![Alert Controller Custom View](./Screenshots/custom-view.png)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 11.0+

## Installation

AlertController is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AlertController'
```

# Usage

### Basic alert

```swift
let alertController = AlertController.alertControllerWithTitle("Hello, World!", message: "This Is An Alert Controller!")
let alertAction = AlertAction(withTitle: "Dismiss", style: .filled, handler: nil)
alertController.addAction(alertAction)
present(alertController, animated: true, completion: nil)
```

### Add multiple actions

```swift
let okAction = AlertAction(withTitle: "OK", style: .filled, handler: nil)
let maybeAction = AlertAction(withTitle: "Maybe", style: .hollow, handler: nil)
let dismissAction = AlertAction(withTitle: "Dismiss", style: .default, handler: nil)
alertController.addActions([okAction, maybeAction, dismissAction])
```

### Implement action handlers

```swift
let handlerAlertAction = AlertAction(withTitle: "Do Something", style: .filled, handler: { (alertAction) in
	print("Button was clicked!")
})
```

### Background Styles

```swift
.transparent: Displays a transparent background over the presenting view controller (default)
.clear: Displays a clear background over the presenting view controller.
.blurred: Displays a blurred background over the presenting view controller.
```

### Action Styles
```swift
.default: Displays a text based button (default)
.filled: Displays a color filled button.
.hollow: Displays a text based button with a border for a hollow look.
```

## Author

Appmazo LLC, jhickman@appmazo.com

## License

AlertController is available under the MIT license. See the LICENSE file for more info.

## Buy Me A Beer?
[![Beerpay](https://beerpay.io/Appmazo/AlertController/badge.svg)](https://beerpay.io/Appmazo/AlertController)
