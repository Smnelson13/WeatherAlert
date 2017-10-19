//
//  CitiesViewController.swift
//  WeatherAlert
//
//  Created by Shane Nelson on 10/19/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

import UIKit
import GooglePlaces

class CitiesViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func searchButtonTapped(_ sender: Any)
  {
    
    //UINavigationBar.appearance().setTextColor(UIColor.black)
    let autocompleteController = GMSAutocompleteViewController()
    autocompleteController.delegate = self
    UINavigationBar.appearance().barTintColor = UIColor(red: 44.0/255, green: 44.0/255, blue: 49.0/255, alpha: 1.0)
    present(autocompleteController, animated: true, completion: nil)
    let filter = GMSAutocompleteFilter()
    filter.type = GMSPlacesAutocompleteTypeFilter.city
    
  }
  
  @IBAction func doneButtonTapped(_ sender: Any)
  {
    self.dismiss(animated: true, completion: nil)
  }
  
    
}






extension CitiesViewController: GMSAutocompleteViewControllerDelegate
{
  
  // Handle the user's selection.
  func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace)
  {
    print("Place name: \(place.name)")
    print("Place address: \(place.formattedAddress)")
    print("Place attributions: \(place.attributions)")
    print("Place Id: \(place.placeID)")
    print("Place Coordinates: \(place.coordinate)")
    dismiss(animated: true, completion: nil)
  }
  
  func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error)
  {
    // TODO: handle the error.
    print("Error: ", error.localizedDescription)
  }
  
  // User canceled the operation.
  func wasCancelled(_ viewController: GMSAutocompleteViewController)
  {
    dismiss(animated: true, completion: nil)
  }
  
  // Turn the network activity indicator on and off again.
  func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController)
  {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }
  
  func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController)
  {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }
  
}

