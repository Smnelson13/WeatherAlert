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
    @IBOutlet weak var bottomLeftImage: SKYIconView!
    @IBOutlet weak var topLeftImage: SKYIconView!
    @IBOutlet weak var middleImage: SKYIconView!
    @IBOutlet weak var topRightImage: SKYIconView!
    @IBOutlet weak var bottomRightImage: SKYIconView!
    
    let transition = CircularTransition()
    let locationManager = CLLocationManager()
    var apiController: APIController!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "infoVC")
        {
            let infoVC = segue.destination as! InformationViewController
            infoVC.transitioningDelegate = self
            infoVC.modalPresentationStyle = .custom
        }
       
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
    let images: [SKYIconView] = [mainImageView, bottomRightImage, bottomLeftImage, topRightImage, topLeftImage, middleImage]
    for image in images { image.setColor = .white }
    GradientApplier.apply(to: self.view)
    testGradient()
    infoButton.layer.cornerRadius = 15
    apiController = APIController(delegate: self)
    
  
    
    // Change this to properly handle a view appearing rather than fire off un needed functions
    loadCurrentLocation()
    
  }
  
  func viewDidAppear()
  {
    apiController = APIController(delegate: self)
  }
  
    
    override func viewDidAppear(_ animated: Bool)
    {
        // refresh weather data
    }

  override func didReceiveMemoryWarning()
  {
      super.didReceiveMemoryWarning()
    
  }

  // the way to process single calls.
  func didRecieve(_ results: [String : Any])
  {
    let currentWeather = Weather(weatherDictionary: results)
    //let hourlyWeather = Weather(weatherDictionary: results)
    let dispatchQueue = DispatchQueue.main
    dispatchQueue.async {

      self.currentTemperatureLabel.text = "\(currentWeather.temperature.rounded())℉"
      self.mainImageView.setType = Skycons(rawValue: currentWeather.icon)!
    
    }


  }
    
    func didRecieveForecast(_ results: [String : Any])
    {
        let dispatchQueue = DispatchQueue.main
        dispatchQueue.async {

            let forcastWeather = ForecastWeather(forecastDictionary: results)
            self.bottomLeftImage.setType = Skycons(rawValue: forcastWeather.icon)!
            self.topLeftImage.setType = Skycons(rawValue: forcastWeather.icon)!
            self.middleImage.setType = Skycons(rawValue: forcastWeather.icon)!
            self.topRightImage.setType = Skycons(rawValue: forcastWeather.icon)!
            self.bottomRightImage.setType = Skycons(rawValue: forcastWeather.icon)!

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
        apiController.forecastRequest(coordinate: location.coordinate)
    }
  }

  func testGradient()
  {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = self.view.frame
    gradientLayer.colors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor]
    gradientLayer.locations = [0.0, 0.05, 1.0]
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
    self.view.layer.insertSublayer(gradientLayer, at: 0)
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






