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


protocol APIControllerPRotocol
{
  func didRecieve(_results: [String: Any])
}

class APIController
{
  var delegate: APIControllerPRotocol?
  
  init(delegate: APIControllerPRotocol)
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
            self.delegate?.didRecieve(results)
          }
        }
      }
    })
    
    task.resume()
  }
  
  
  func retrieveBackgroundImage()
  {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    let url = URL (string: "https://maps.googleapis.com/maps/api/place/photo?photoreference=\(photoReference)&maxwidth=400&key=\(GoogleAPIKey)")
    let session = URLSession.shared
    
    let task = session.dataTask(with: url, completionHandler: { data, responce, error -> Void in
      
      if let error = error
      {
        print(error.localizedDescription)
      }
      else
      {
        if let dictionary = self.parseJSON(data!)
        {
          if let results = Dictiona["photoReference"] as? [String: Any]
          {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
          }
        }
      }
      
    })
  
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
