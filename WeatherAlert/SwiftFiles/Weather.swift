//
//  Weather.swift
//  WeatherAlert
//
//  Created by Shane Nelson on 10/16/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

import Foundation


class Weather
{
  
  
  let temperature: Double
  let humidity: Double
  let apparentTemperature: Double
  let icon: String
  let summary: String
  let windSpeed: Double
  let visibility: Double
  
  init(weatherDictionary: [String: Any])
  {
    temperature = weatherDictionary["temperature"] as! Double
    humidity = weatherDictionary["humidity"] as! Double
    apparentTemperature = weatherDictionary["apparentTemperature"] as! Double
    icon = weatherDictionary["icon"] as! String
    summary = weatherDictionary["summary"] as! String
    windSpeed = weatherDictionary["windSpeed"] as! Double
    visibility = weatherDictionary["visibility"] as! Double
  }
  
//  let temperature: Double
//  let time: Int
//  let icon: String
//  let precipProbability: Double
//  let precipIntensity: Double
//  let apparentTemperature: Double
//  let dewPoint: Double
//  let humidity: Double
//  let windSpeed: Double
//  let Visibility: Double
//  let cloudCover: Double
//  let pressure: Double
//  let ozone:Double
//
//  init(weatherDictionary: [String: Any])
//  {
//    temperature = weatherDictionary["temperature"] as! Double
//    time = weatherDictionary["time"] as! Int
//    icon = weatherDictionary["icon"] as! String
//    precipIntensity = weatherDictionary["[precipIntensity"] as! Double
//    precipProbability = weatherDictionary["precipProbability"] as! Double
//    apparentTemperature = weatherDictionary["apparentTemperature"] as! Double
//    dewPoint = weatherDictionary["dewPoint"] as! Double
//    humidity = weatherDictionary["humidity"] as! Double
//    windSpeed = weatherDictionary["windSpeed"] as! Double
//    Visibility = weatherDictionary["visibility"] as! Double
//    cloudCover = weatherDictionary["cloudCover"] as! Double
//    pressure = weatherDictionary["pressure"] as! Double
//    ozone = weatherDictionary["ozone"] as! Double
//  }
}
