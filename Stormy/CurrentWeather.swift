//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Nick Reichard on 3/25/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


struct CurrentWeather {
    
    let temperature: Double
    let humidity: Double
    let percipitationProbability: Double
    let summary: String
    let icon: String
    
}

// Takes JSON data and creates an instance of current weather

extension CurrentWeather {
    
    struct Key {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let percipitationProbablility = "percipProbability"
        static let summery = "summary"
        static let icon = "icon"
    }
    
    init?(jsonDictionay: [String: AnyObject]) {
        guard let tempValue = jsonDictionay[Key.temperature] as? Double,
            let humidityValue = jsonDictionay[Key.humidity] as? Double,
            let percipitationProbabilityValue = jsonDictionay[Key.percipitationProbablility] as? Double,
            let summaryString = jsonDictionay[Key.summery] as? String,
            let iconString = jsonDictionay[Key.icon] as? String else { return nil }
        
        self.temperature = tempValue
        self.humidity = humidityValue
        self.percipitationProbability = percipitationProbabilityValue
        self.summary = summaryString
        self.icon = iconString
    
    }
}

// We want a model instance our of the json 
