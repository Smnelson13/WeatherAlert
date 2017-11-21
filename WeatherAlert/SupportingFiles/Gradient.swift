//
//  Gradient.swift
//  WeatherAlert
//
//  Created by Shane Nelson on 11/17/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

import Foundation
import UIKit

struct GradientApplier
{
  static func apply(to view: UIView)
  {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = view.frame
    gradientLayer.colors = [sunset1.cgColor, sunset2.cgColor]
    gradientLayer.locations = [0.0, 1.3]
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
    view.layer.insertSublayer(gradientLayer, at: 0)
  }
}
