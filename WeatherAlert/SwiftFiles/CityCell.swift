//
//  CityCell.swift
//  Pods-WeatherAlert
//
//  Created by Shane Nelson on 10/28/17.
//

import UIKit

class CityCell: UITableViewCell
{
  @IBOutlet weak var cityNameLabel: UILabel!
  @IBOutlet weak var cityDescriptionLabel: UILabel!
  
  override func awakeFromNib()
  {
      super.awakeFromNib()
      // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool)
  {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
  }

}
