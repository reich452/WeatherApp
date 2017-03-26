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
        getCurrentWeather()
    }
    
    @IBAction func getCurrentWeather() {
        toggleRefreshAnimation(on: true)
        
        let client = DarkSkyAPIClient()
        
        let coordinate = Coordinate(latitude: 37.8267, longitude: -122.4233)
        
        client.getCurrentWeather(at: coordinate) { [unowned self] currentWeather, error in
            
            if let currentWeather = currentWeather {
                let viewModel = CurrentWeatherViewModel(model: currentWeather)
                self.displayWeather(using: viewModel)
                self.toggleRefreshAnimation(on: false)
            }
            // Else put in an alert of what went wrong
        }
    }
    
    func toggleRefreshAnimation(on: Bool) {
        refreshButton.isHidden = on
        
        if on {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
   
    
    func displayWeather(using viewModel: CurrentWeatherViewModel) {
        currentTemperatureLabel.text = viewModel.temperature
        currentHumidityLabel.text = viewModel.humidity
        currentPrecipitationLabel.text = viewModel.precipitationProbablility
        currentSummaryLabel.text = viewModel.summary
        currentWeatherIcon.image = viewModel.icon
    }
    
    // MARK: - Properties
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

}

// Recap 
// - Making network requests
// - Using JSON
// - Using closures to pass around arbitrary code
// - Writing modular code
// - Writing asynchronous code

// - Completion handlers have to be marked @escaping since they are executed some point after the enclosing function has been executed.














