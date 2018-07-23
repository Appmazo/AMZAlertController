//
//  UIImage+Extensions.swift
//  AppmazoFoundation
//
//  Created by James Hickman on 7/19/18.
//

import Foundation

public extension UIImage {
    /**
     Create a scaled version of the image.
     
     - parameters:
        -  image: The image to scale.
        -  size: The size to scale the image to.

     - returns: The scaled image.
     */
    public class func scaledImage(_ image:UIImage, withSize size:CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0);
        image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: size.width, height: size.height)))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}
