//
//  CurrentWeatherViewModel.swift
//  Stormy
//
//  Created by Nick Reichard on 3/25/17.
//  Copyright © 2017 Treehouse. All rights reserved.

//  Simple object that that formats data

import Foundation
import UIKit

struct CurrentWeatherViewModel {
    let temperature: String
    let humidity: String
    let precipitationProbablility: String
    let summary: String
    let icon: UIImage
    
    // custom initializer - inside will overide the memberize initilizer
    init(model: CurrentWeather) {
        let roundedTemperature = Int(model.temperature)
        self.temperature = "\(roundedTemperature)º"
        
        let humidityPercentValue = Int(model.humidity * 100)
        self.humidity = "\(humidityPercentValue)%"
        
        let percipPercentValue = Int(model.humidity * 100)
        self.precipitationProbablility = "\(percipPercentValue)%"
        
        self.summary = model.summary
        
        let weatherIcon = WeatherIcon(iconString: model.icon)
        self.icon = weatherIcon.image
        
    }
}
