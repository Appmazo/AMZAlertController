//
//  URL+Extensions.swift
//  AppmazoKit
//
//  Created by James Hickman on 5/29/18.
//  Copyright © 2018 Appmazo, LLC. All rights reserved.
//

import Foundation

public extension URL {
    struct ValidationQueue {
        static var queue = OperationQueue()
    }

    public mutating func isValid(_ completion: @escaping (Bool) -> Void) {
        if self.absoluteString.count == 0 {
            completion(false)
            return
        }

        // Ignore prefixes (including partials)
        let prefixes = ["http://", "https://", "http://www.", "https://www.", "www."]
        for prefix in prefixes
        {
            if prefix.range(of: absoluteString, options: .caseInsensitive, range: nil, locale: nil) != nil {
                completion(false)
                return
            }
        }

        // Ignore URLs with spaces
        let range = absoluteString.rangeOfCharacter(from: .whitespaces)
        if range != nil {
            completion(false)
            return
        }

        // Check that URL already contains required 'http://' or 'https://', prepend if it does not
        let urlString = absoluteString
        if !urlString.hasPrefix("http://") && !urlString.hasPrefix("https://")
        {
            if let formattedURL = URL(string: "http://" + urlString) {
                self = formattedURL
            }
        }
        
        // Test that URL actually exists by sending a URL request that returns only the header response
        let urlRequest = URLRequest(url: self)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            // do stuff with response, data & error here
            if (error != nil)
            {
                completion(false)
                return
            }
            
            // URL Responded - Check Status Code
            if let urlResponse = response as? HTTPURLResponse
            {
                if ((urlResponse.statusCode >= 200 && urlResponse.statusCode < 400) || urlResponse.statusCode == 405)// 200-399 = Valid Responses, 405 = Valid Response (Weird Response on some valid URLs)
                {
                    completion(true)
                    return
                }
            }
            
            completion(false)
            return
        })
        task.resume()
    }
}
