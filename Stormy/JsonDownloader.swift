//
//  JsonDownloader.swift
//  Stormy
//
//  Created by Nick Reichard on 3/25/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


class JsonDownloader {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    typealias JSON = [String: AnyObject]
    
    func jsonTask(with request: URLRequest, completionHandler completion: @escaping (JSON?, DarkSkyError?) -> Void) ->URLSessionDataTask {
        let task = session.dataTask(with: request) { data, response, error in
            
            // Convert to HTTP Response
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
                        completion(json, nil)
                    } catch {
                        completion(nil, .jsonConversionFailure)
                    }
                } else {
                    completion(nil, .invalidData)
                }
            } else {
                completion(nil, .responseUnsucessful)
            }
        }
        return task
    }
    
}


