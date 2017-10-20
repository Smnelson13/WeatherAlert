//
//  InformationViewController.swift
//  WeatherAlert
//
//  Created by Shane Nelson on 10/19/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController
{
    @IBOutlet weak var doneButton: UIButton!
    @IBAction func doneButtonTapped(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        doneButton.layer.cornerRadius = 10
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
