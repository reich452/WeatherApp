//
//  ViewController.swift
//  Stormy
//
//  Created by Pasan Premaratne on 2/15/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentWeather = CurrentWeather(temperature: 85.0, humidity: 0.8, percipitationProbability: 0.1, summary: "Hot", icon: "clear-day")
        let currentWeatherViewModel = CurrentWeatherViewModel(model: currentWeather)
        
        displayWeather(using: currentWeatherViewModel)
        
        let base = URL(string: "https://api.darksky.net/forecast/\(darkSkyApiKey)/")
        guard let forcastUrl = URL(string: "37.8267,-122.4233", relativeTo: base) else { return }
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let request = URLRequest(url: forcastUrl)
        
        print("Log inside completion handeler")
        
       let dataTask = session.dataTask(with: request) { data, response, error in
            print(data)
        }
        dataTask.resume()
        
        print("Log after resume")

    }
    
    func displayWeather(using viewModel: CurrentWeatherViewModel) {
        currentTemperatureLabel.text = viewModel.temperature
        currentHumidityLabel.text = viewModel.humidity
        currentPrecipitationLabel.text = viewModel.precipitationProbablility
        currentSummaryLabel.text = viewModel.summary
        currentWeatherIcon.image = viewModel.icon
    }
    
    // MARK: - Properties

    
    fileprivate let darkSkyApiKey = "d5bfa0c8a4e1486ffff5cfb75acd4ba8"
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
}
















