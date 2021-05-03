//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    
    }
  

    @IBAction func searchPressed(_ sender: UIButton) {
        
        if searchTextField.text != nil {
            print(searchTextField.text!)
        }
        view.endEditing(true)
    }
}

extension WeatherViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if searchTextField.text != nil {
            print(searchTextField.text!)
        }
        view.endEditing(true)
        
        return true
    }
    //validate what the user wrote
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //Use searchTextField.text to get the weather for that city
        
        if let city = searchTextField.text {
        weatherManager.fetchWeather(cityName: city)
        }
        
        let weather: WeatherModel?
        
        //conditionImageView.image = UIImage(systemName: weather!.conditionName)
        searchTextField.text = ""
    }
}

