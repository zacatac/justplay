//
//  CAGradientLayerExtension.swift
//  justplay
//
//  Created by Zack Field on 3/12/15.
//  Copyright (c) 2015 Zack Field. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    func turquoiseColor() -> CAGradientLayer {
        let topColor = UIColor(red: (23.0/255.0), green: (23.0/255.0), blue: (255.0/255.0), alpha:1.0)
        let bottomColor = UIColor(red: (249.0/255.0), green: (133.0/255.0), blue: (103.0/255.0), alpha: 1.0)
        

        //        let topColor = UIColor(red: (84/255.0), green: (187/255.0), blue: (187/255.0), alpha: 1)
//        let bottomColor = UIColor(red: (15/255.0), green: (118/255.0), blue: (128/255.0), alpha: 1)

        
        let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        let gradientLocations: [Float] = [0.0, 1.1]
        let startPoint: CGPoint = CGPointMake(0, 0)
        let endPoint: CGPoint = CGPointMake(1, 1)
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        return gradientLayer
    }
}