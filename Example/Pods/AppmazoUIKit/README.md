# AppmazoUIKit

[![Build Status](https://travis-ci.com/Appmazo/AppmazoUIKit.svg?style=flat)](https://travis-ci.com/Appmazo/AppmazoUIKit)
[![Version](https://img.shields.io/cocoapods/v/AppmazoUIKit.svg?style=flat)](http://cocoapods.org/pods/AppmazoUIKit.svg)
[![License](https://img.shields.io/cocoapods/l/AppmazoUIKit.svg?style=flat)](http://cocoapods.org/pods/AppmazoUIKit.svg)
[![Platform](https://img.shields.io/cocoapods/p/AppmazoUIKit.svg?style=flat)](http://cocoapods.org/pods/AppmazoUIKit.svg)
[![Beerpay](https://beerpay.io/Appmazo/AppmazoUIKit/badge.svg?style=beer-square)](https://beerpay.io/Appmazo/AppmazoUIKit)
[![Beerpay](https://beerpay.io/Appmazo/AppmazoUIKit/make-wish.svg?style=flat-square)](https://beerpay.io/Appmazo/AppmazoUIKit?focus=wish)

# Introduction
AppmazoUIKit is a simple collection of useful UI elements that will help with standard app development and boilerplate code. 

## Installation

AppmazoUIKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AppmazoUIKit'
```

# Classes

## Button

Button is a simple subclass of ```UIButton``` that includes multiple button types for a more modern UI as well as an *impression* style click animation.

## ButtonTableViewCell

```ButtonTableViewCell``` is a simple ```UITableViewCell``` subclass that displays a ```Button```.

### Delegate Implementation

Notifies you when the button was pressed:

```swift
func buttonTableViewCell(_ buttonTableViewCell: ButtonTableViewCell, buttonPressed: Button)
```

## DatePickerTableViewCell

```ButtonTableViewCell``` is a simple ```UITableViewCell``` subclass that displays a Button.

### Delegate Implementation

Notifies you when the user finished picking the date and pressed the done button:

```swift
func datePickerTableViewCell(_ datePickerTableViewCell: DatePickerTableViewCell, didFinishPickingDate date: Date?)
```

Notifies you when the date changes in real-time:

```swift
func datePickerTableViewCell(_ datePickerTableViewCell: DatePickerTableViewCell, didChangeDate date: Date?)
```

## LocationTableViewCell

```LocationTableViewCell``` is a simple ```UITableViewCell``` for handling a user's location. It can be used to display the user's location automatically as well as allow users to change it to a custom location.

### Delegate Implementation

Notifies you when the user pressed the location button so you can refresh their location:

```swift
func locationTableViewCell(_ locationTableViewCell: LocationTableViewCell, locationButtonPressed locationButton: Button)
```

Notifies you when the user's finished editing their custom location:

```swift
func locationTableViewCell(_ locationTableViewCell: LocationTableViewCell, locationTextUpdated locationText:String?)
```

## PermissionPromptTableViewCell

```PermissionPromptTableViewCell``` is a simple ```UITableViewCell``` for requesting common ```iOS``` permissions. 

*Currently Supports:*
```Push Notifications```
```Location Services```
```FaceID```
```TouchID```

### Delegate Implementation

Notifies you when the user presses the button to enable permissions:

```swift
func permissionPromptTableViewCell(_ permissionPromptTableViewCell: PermissionPromptTableViewCell, buttonPressed: Button)
```

## SubtitleTableViewCell

```SubtitleTableViewCell``` is a simple ```UITableViewCell``` for dequeuing a ```UITableViewCell``` using the ```UITableViewCellStyleSubtitle``` style.

## FormFieldTableViewCell

```FormFieldTableViewCell``` is a ```UITableViewCell``` for form filling. It contains a basic prompt label and container ```UIView``` for subclasses to embed custom views:

## DateFormFieldTableViewCell

```DateFormFieldTableViewCell``` is a ```FormFieldTableViewCell``` subclass for selecting a date.

### Delegate Implementation

Notifies you when the user finishes picking the date and presses the done button:

```swift
func dateFormFieldTableViewCell(_ dateFormFieldTableViewCell: DateFormFieldTableViewCell, didFinishPickingDate date: Date?)
```

Notifies you when the user changes the date in real-time:

```swift
func dateFormFieldTableViewCell(_ dateFormFieldTableViewCell: DateFormFieldTableViewCell, didChangeDate date: Date?)
```

## QuantityFormFieldTableViewCell

```QuantityFormFieldTableViewCell``` is a ```FormFieldTableViewCell``` subclass for setting a quantity using a ```UIPickerView```:

### Delegate Implementation

Notifies you when the user finishes setting the quantity and hits the done button:

```swift
func quantityFormFieldTableViewCell(_ quantityFormFieldTableViewCell: QuantityFormFieldTableViewCell, didFinishPickingValue value: Int)
```

Notifies you when the user changes the quantity in real-time:

```swift
func quantityFormFieldTableViewCell(_ quantityFormFieldTableViewCell: QuantityFormFieldTableViewCell, didUpdateValue value: Int)
```

## TextFormFieldTableViewCell

```TextFormFieldTableViewCell``` is a ```FormFieldTableViewCell``` subclass for allowing custom text entry.

### Delegate Implementation

Notifies you when the user changes the text in real-time:

```swift
func formFieldTableViewCell(_ formFieldTableViewCell: FormFieldTableViewCell, didUpdateText text: String?)
```

Notifies you when the user begins editing the text:

```swift
func formFieldTableViewCellDidBeginEditing(_ formFieldTableViewCell: FormFieldTableViewCell)
```

Notifies you when the user ends editing:

```swift
func formFieldTableViewCellDidEndEditing(_ formFieldTableViewCell: FormFieldTableViewCell)
```

## Author

Appmazo LLC, jhickman@appmazo.com

## License

AppmazoUIKit is available under the MIT license. See the LICENSE file for more info.

## Buy Me A Beer?
[![Beerpay](https://beerpay.io/Appmazo/AppmazoUIKit/badge.svg?style=beer-square)](https://beerpay.io/Appmazo/AppmazoUIKit)
