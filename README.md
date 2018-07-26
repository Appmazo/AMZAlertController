# AMZAlertController

[![Build Status](https://travis-ci.com/Appmazo/AMZAlertController.svg?style=flat)](https://travis-ci.com/Appmazo/AMZAlertController)
[![Version](https://img.shields.io/cocoapods/v/AMZAlertController.svg?style=flat)](http://cocoapods.org/pods/AMZAlertController.svg)
[![License](https://img.shields.io/cocoapods/l/AMZAlertController.svg?style=flat)](http://cocoapods.org/pods/AMZAlertController.svg)
[![Platform](https://img.shields.io/cocoapods/p/AMZAlertController.svg?style=flat)](http://cocoapods.org/pods/AMZAlertController.svg)
[![Beerpay](https://beerpay.io/Appmazo/AMZAlertController/badge.svg)](https://beerpay.io/Appmazo/AMZAlertController)
[![Beerpay](https://beerpay.io/Appmazo/AMZAlertController/make-wish.svg?style=flat-square)](https://beerpay.io/Appmazo/AMZAlertController?focus=wish)

# Introduction

AMZAlertController is a simple and modern alert controller which is better than but familiar to UIAlertController.

![Single Button](./Screenshots/single-button.png)
![Double Button with Image](./Screenshots/double-button-with-image.png)
![Triple Button](./Screenshots/triple-button.png)
![Blurred Background](./Screenshots/blurred-background.png)
![Clear Background](./Screenshots/clear-background.png)
![Clear Background with Shadow](./Screenshots/clear-background-with-shadow.png)
![Custom View](./Screenshots/custom-view.png)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 11.0+

## Installation

AMZAlertController is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AMZAlertController'
```

# Usage

### Basic alert

```swift
let alertController = AMZAlertController.alertControllerWithTitle("Hello, World!", message: "This Is An Alert Controller!")
let alertAction = AMZAlertAction(withTitle: "Dismiss", style: .filled, handler: nil)
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

AMZAlertController is available under the MIT license. See the LICENSE file for more info.

## Buy Me A Beer?
[![Beerpay](https://beerpay.io/Appmazo/AMZAlertController/badge.svg)](https://beerpay.io/Appmazo/AMZAlertController)
