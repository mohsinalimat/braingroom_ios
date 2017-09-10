//
//  Constants.swift
//  brainGroom
//
//  Created by Satya Mahesh on 12/08/17.
//  Copyright © 2017 Mahesh. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    static let mainURL = "https://dev.braingroom.com/apis/"
    static let mainURLProd = "https://www.braingroom.com/apis/"
}

@IBDesignable class GradientView: UIView
{
    @IBInspectable var topColor: UIColor = UIColor.white
    @IBInspectable var bottomColor: UIColor = UIColor.black
    
    override class var layerClass: AnyClass
    {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews()
    {
        (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
    }
}

