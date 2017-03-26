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
    
    func getCurrentWeather(at coordinate: Coordinate, completionHandeler completion: CurrentWeatherCompletionHandler) {
        
    }
    
}
