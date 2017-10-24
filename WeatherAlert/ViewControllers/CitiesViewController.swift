//
//  CitiesViewController.swift
//  WeatherAlert
//
//  Created by Shane Nelson on 10/19/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

import UIKit
import GooglePlaces


class CitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

  var places = [GMSPlace]()
  var placesCoordinates = [CLLocationCoordinate2D]()
  
  @IBOutlet weak var citiesTableView: UITableView!
  
  override func viewDidLoad()
  {
      super.viewDidLoad()
      view.backgroundColor = customGrey
      citiesTableView.layer.cornerRadius = 20
      citiesTableView.separatorColor = UIColor.black

    
  }

  override func didReceiveMemoryWarning()
  {
      super.didReceiveMemoryWarning()
  
  }
  
  @IBAction func searchButtonTapped(_ sender: Any)
  {
  //https://developers.google.com/places/ios-api/autocomplete
  //UINavigationBar.appearance().setTextColor(UIColor.black)
  let autocompleteController = GMSAutocompleteViewController()
  autocompleteController.delegate = self
  //UINavigationBar.appearance().barTintColor = UIColor(red: 44.0/255, green: 44.0/255, blue: 49.0/255, alpha: 1.0)
  //UINavigationBar.appearance().tintColor = UIColor.white
  //UISearchBar.appearance().backgroundColor = UIColor(red: 44.0/255, green: 44.0/255, blue: 49.0/255, alpha: 1.0)
  //UISearchBar.appearance().setPlaceholderTextColor(.white)
  //UISearchBar.appearance().setSearchImageColor(.white)
  //UISearchBar.appearance().setTextColor(UIColor.white)
  UISearchBar.appearance().barStyle = UIBarStyle.default
  present(autocompleteController, animated: true, completion: nil)
  let filter = GMSAutocompleteFilter()
  filter.type = GMSPlacesAutocompleteTypeFilter.city
  
  }

  @IBAction func doneButtonTapped(_ sender: Any)
  {
  self.dismiss(animated: true, completion: nil)
  }
  
  func numberOfSections(in tableView: UITableView) -> Int
  {
      return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
      return places.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "CityCell")
    cell.textLabel?.text = places[indexPath.row].name
    
    return cell
  }
  

  
  
}






extension CitiesViewController: GMSAutocompleteViewControllerDelegate
{

  // Handle the user's selection.
  func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace)
  {
    self.places.append(place)
    self.citiesTableView.reloadData()
    self.placesCoordinates.append(place.coordinate)

    
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

