//
//  APIController.swift
//  WeatherAlert
//
//  Created by Shane Nelson on 10/15/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation


protocol APIControllerDelegate: class
{
    //func apiController(didReceive darkSkyResults: [String: Any]) // how to handle data with multiple calls
    func didRecieve(_ results: [String: Any]) // single call way to handle data
    func didRecieveForecast(_ results: [String: Any])
}

class APIController
{
  weak var delegate: APIControllerDelegate?
  
  init(delegate: APIControllerDelegate)
  {
    self.delegate = delegate
  }
  
  func searchDarkSky(coordinate: CLLocationCoordinate2D)
  {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    let url = URL(string: "https://api.darksky.net/forecast/\(darkSkyAPIKey)/\(coordinate.latitude),\(coordinate.longitude)")!
    let session = URLSession.shared

    let task = session.dataTask(with: url, completionHandler: { data, response, error -> Void in

      print("Task completed")
      if let error = error
      {
        print(error.localizedDescription)
      }
      else
      {
        if let dictionary = self.parseJSON(data!)
        {
          if let results = dictionary["currently"] as? [String: Any]
          {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            //self.delegate?.didRecieveDarkSky(results) // Multiple way
            self.delegate?.didRecieve(results)
          }
        }
      }
    })

    task.resume()
  }
    
    
    func forecastRequest(coordinate: CLLocationCoordinate2D)
    {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let url = URL(string: "https://api.darksky.net/forecast/\(darkSkyAPIKey)/\(coordinate.latitude),\(coordinate.longitude)")!
        let session = URLSession.shared
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error -> Void in
            
            print("Task completed")
            if let error = error
            {
                print(error.localizedDescription)
            }
            else
            {
                if let dictionary = self.parseJSON(data!)
                {
                    if let results = dictionary["hourly"] as? [String: Any]
                    {
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                        //self.delegate?.didRecieveDarkSky(results) // Multiple way
                        self.delegate?.didRecieveForecast(results)
                    }
                }
            }
        })
        
        task.resume()
    }
    
  
  
  func parseJSON(_ data: Data) -> [String: Any]?
  {
    do
    {
      let json = try JSONSerialization.jsonObject(with: data, options: [])
      if let dictionary = json as? [String: Any]
      {
        return dictionary
      }
      else
      {
        return nil
      }
    }
    catch
    {
      print(error)
      return nil
    }
  }
  
  
  
}


// commented out code is the method for combining calls into one function
//  func searchDarkSky(for coordinate: CLLocationCoordinate2D)
//  {
//    let url = "https://api.darksky.net/forecast/\(darkSkyAPIKey)/\(coordinate.latitude),\(coordinate.longitude)"
//    request(url) { json, error in
//      if let json = json,
//        let currently = json["currently"] as? [String: Any],
//        let hourly = json["hourly"] as? [String: Any]
//      {
//        self.delegate?.apiController(didReceive: json)
//      } else if let error = error
//      {
//        // handle error
//      }
//    }
//  }
//
//  func request(_ url: String, _ completion: @escaping ([String: Any]?, Error?) -> Void)
//  {
//    guard let url = URL(string: url) else { return }
//    UIApplication.shared.isNetworkActivityIndicatorVisible = true
//    URLSession.shared.dataTask(with: url) { data, response, error in
//      UIApplication.shared.isNetworkActivityIndicatorVisible = false
//      if let data = data, let json = self.parseJSON(data)
//      {
//        completion(json, nil)
//      } else if let error = error
//      {
//        completion(nil, error)
//      }
//    }
//  }
//
//  func parseJSON(_ data: Data) -> [String: Any]?
//  {
//    do
//    {
//      return try JSONSerialization
//        .jsonObject(with: data, options: []) as? [String: Any]
//    }
//    catch
//    {
//      print(error)
//      return nil
//    }
//  }
//
