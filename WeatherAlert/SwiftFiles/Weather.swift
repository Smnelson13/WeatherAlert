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
  
  
  init(weatherDictionary: [String: Any])
  {
    temperature = weatherDictionary["temperature"] as! Double
  
  }
}
