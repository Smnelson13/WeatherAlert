//
//  Weather.swift
//  WeatherAlert
//
//  Created by Shane Nelson on 10/16/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

import Foundation


struct Weather: Decodable
{
  let temperature: Double
  let humidity: Double
  let apparentTemperature: Double
  let icon: String
  let summary: String
  let windSpeed: Double
  let visibility: Double
  
//  init(weatherDictionary: [String: Any])
//  {
//    temperature = weatherDictionary["temperature"] as! Double
//    humidity = weatherDictionary["humidity"] as! Double
//    apparentTemperature = weatherDictionary["apparentTemperature"] as! Double
//    icon = weatherDictionary["icon"] as! String
//    summary = weatherDictionary["summary"] as! String
//    windSpeed = weatherDictionary["windSpeed"] as! Double
//    visibility = weatherDictionary["visibility"] as! Double
//  }
 
}
