//
//  DarkSkyAPIclient.swift
//  Stormy
//
//  Created by Nick Reichard on 3/26/17.
//  Copyright © 2017 Treehouse. All rights reserved.
// Give us back the current weather into a populated instance

import Foundation

class DarkSkyAPIClient {
    
    fileprivate let apiKey = "d5bfa0c8a4e1486ffff5cfb75acd4ba8"
    
    lazy var baseURL: URL = {
        return URL(string: "https://api.darksky.net/forecast/\(self.apiKey)/")!
    }()
    
    let downloader = JsonDownloader()
    
    typealias CurrentWeatherCompletionHandler = (CurrentWeather?, DarkSkyError?) -> Void
    
    func getCurrentWeather(at coordinate: Coordinate, completionHandeler completion: @escaping CurrentWeatherCompletionHandler) {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseURL) else {
            completion(nil, .invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        
        // jsonTask converts raw data in to JSON -
        // We want the json to go through our model - failable initializer
        let task = downloader.jsonTask(with: request) { json, error in
            
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                
                guard let currentWeatherJson = json["currenly"] as? [String : AnyObject], let currentWeather = CurrentWeather(jsonDictionay: currentWeatherJson) else {
                    completion(nil, .jsonParsingFailure)
                    return
                }
                
                completion(currentWeather, nil)
            }
        }
        task.resume()
    }
}
