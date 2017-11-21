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
  let icon: String

  init(forecastDictionary: [String: Any])
    
  {
    icon = forecastDictionary["icon"] as! String
  }
    
   
}
