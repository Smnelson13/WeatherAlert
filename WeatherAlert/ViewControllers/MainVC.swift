//
//  MainVC.swift
//  WeatherAlert
//
//  Created by Shane Nelson on 10/16/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

import UIKit
import CoreLocation


class MainVC: UIViewController, CLLocationManagerDelegate, APIControllerDelegate, UIViewControllerTransitioningDelegate
{
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mainImageView: SKYIconView!
  
    let transition = CircularTransition()
  
  let locationManager = CLLocationManager()
  var apiController: APIController!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let infoVC = segue.destination as! InformationViewController
        infoVC.transitioningDelegate = self
        infoVC.modalPresentationStyle = .custom
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = infoButton.center
        transition.circleColor = infoButton.backgroundColor!
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = infoButton.center
        transition.circleColor = infoButton.backgroundColor!
        
        return transition
    }
    
   override func viewDidLoad()
   {
    super.viewDidLoad()
    apiController = APIController(delegate: self)
    mainImageView.setColor = UIColor.white
    loadCurrentLocation()
    
  }

  override func didReceiveMemoryWarning()
  {
      super.didReceiveMemoryWarning()
    
  }

  // the way to process single calls.
  func didRecieve(_ results: [String : Any])
  {
    let currentWeather = Weather(weatherDictionary: results)
    let hourlyWeather = Weather(weatherDictionary: results)
    let dispatchQueue = DispatchQueue.main
    dispatchQueue.async {

      self.currentTemperatureLabel.text = "\(currentWeather.temperature)℉"
      //self.mainImageView.setType = Skycons(rawValue: currentWeather.icon)!
      self.mainImageView.setType = Skycons(rawValue: currentWeather.icon)!
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
    //  apiController.searchDarkSky(for: location.coordinate)
      apiController.searchDarkSky(coordinate: location.coordinate)
    }
  }
  
  
}



//how to handle the multiple call function
//  func apiController(didReceive darkSkyResults: [String : Any])
//  {
//    let currentWeather = Weather(weatherDictionary: darkSkyResults)
//
//    self.currentTemperatureLabel.text = "\(currentWeather.temperature)℉"
//    self.dateLabel.text = "\(currentWeather.time)"
//  }






