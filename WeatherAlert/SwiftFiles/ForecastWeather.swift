//
//  ForecastWeather.swift
//  WeatherAlert
//
//  Created by Shane Nelson on 10/20/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

import Foundation


class ForecastWeather
{
    
    
 //   let temperature: Double
//    let humidity: Double
//    let apparentTemperature: Double
    let icon: String
//    let summary: String
//    let windSpeed: Double
//    let visibility: Double
    
    init(forecastDictionary: [String: Any])
    {
   //     temperature = forecastDictionary["temperature"] as! Double
  //      humidity = forecastDictionary["humidity"] as! Double
  //      apparentTemperature = forecastDictionary["apparentTemperature"] as! Double
        icon = forecastDictionary["icon"] as! String
 //       summary = forecastDictionary["summary"] as! String
 //       windSpeed = forecastDictionary["windSpeed"] as! Double
 //       visibility = forecastDictionary["visibility"] as! Double
    }
    
   
}
