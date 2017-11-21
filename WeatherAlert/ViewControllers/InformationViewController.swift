//
//  InformationViewController.swift
//  WeatherAlert
//
//  Created by Shane Nelson on 10/19/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

import UIKit
import SafariServices

class InformationViewController: UIViewController, SFSafariViewControllerDelegate
{
  @IBOutlet weak var developerWebsightButton: UIButton!
  @IBOutlet weak var doneButton: UIButton!
    @IBAction func doneButtonTapped(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad()
    {
      super.viewDidLoad()
      developerWebsightButton.titleEdgeInsets.top = 0
      developerWebsightButton.titleEdgeInsets.left = 2
      developerWebsightButton.titleEdgeInsets.right = 2
      developerWebsightButton.titleEdgeInsets.bottom = 0
      developerWebsightButton.layer.borderWidth = 1.5
      developerWebsightButton.layer.cornerRadius = 5
      developerWebsightButton.layer.borderColor = UIColor.white.cgColor
      doneButton.layer.borderColor = UIColor.white.cgColor
      doneButton.layer.cornerRadius = 10
      developerWebsightButton.layer.cornerRadius = 10
      GradientApplier.apply(to: self.view)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func developerWebsiteButton(_ sender: Any)
  {
    let url = URL(string: "https://smnelson13.github.io")
    
    let svc = SFSafariViewController(url: url!)
      svc .delegate = self as! SFSafariViewControllerDelegate
      self.present(svc, animated: true, completion: nil)
    
  }
  
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
