//
//  ForecastCell.swift
//  WeatherAlert
//
//  Created by SHANE NELSON on 2/12/18.
//  Copyright © 2018 Shane Nelson. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell
{
  @IBOutlet weak var forecastImage: UIImageView!
  @IBOutlet weak var forecastLabel: UILabel!
  
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
