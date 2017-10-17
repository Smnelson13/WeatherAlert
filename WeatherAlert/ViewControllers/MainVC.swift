//
//  MainVC.swift
//  WeatherAlert
//
//  Created by Shane Nelson on 10/16/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

import UIKit
import CoreLocation


class MainVC: UIViewController, APIControllerProtocol, CLLocationManagerDelegate
{
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var mainImageView: UIImageView!
  @IBOutlet weak var bottomLeftImageView: UIImageView!
  @IBOutlet weak var topLeftImageView: UIImageView!
  @IBOutlet weak var middleImageView: UIImageView!
  @IBOutlet weak var topRightImageView: UIImageView!
  @IBOutlet weak var bottomRightImageView: UIImageView!
  
  let locationManager = CLLocationManager()
  var apiController: APIController!
  
   override func viewDidLoad()
   {
    super.viewDidLoad()
    apiController = APIController(delegate: self)
    
    loadCurrentLocation()
    
  }

  override func didReceiveMemoryWarning()
  {
      super.didReceiveMemoryWarning()
    
  }
  
  func didRecieve(_ results: [String : Any])
  {
    let currentWeather = Weather(weatherDictionary: results)
    let dispatchQueue = DispatchQueue.main
    dispatchQueue.async {
      
     // self.temperatureLabel.text = "\(currentWeather.temperature)℉"
    }
    
  
  }
  
  
  func loadCurrentLocation()
  {
    configureLocationManager()
  }
  
  func configureLocationManager()
  {
    if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.denied && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.restricted
    {
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
      if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.notDetermined
      {
        locationManager.requestWhenInUseAuthorization()
      }
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
  {
    if status == CLAuthorizationStatus.authorizedWhenInUse
    {
      locationManager.startUpdatingLocation()
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
  {
    locationManager.stopUpdatingLocation()
    if let location = locations.last
    {
      apiController.searchDarkSky(coordinate: location.coordinate)
      apiController.getBackgroundPhoto()
    }
  }
  
  func didRecieveDarkSky(_ results: [String : Any])
  {
    // do something
  }
  
  
  
}









