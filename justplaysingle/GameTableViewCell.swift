//
//  GameTableViewCell.swift
//  justplay
//
//  Created by Zack Field on 3/12/15.
//  Copyright (c) 2015 Zack Field. All rights reserved.
//

import UIKit

class GameTableViewCell : UITableViewCell {
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var playGameButton: UIButton!
    
    func loadItem(title: String, image: String) {
        self.backgroundColor = UIColor.clearColor()        
        backgroundImage.image = UIImage(named: image)
        backgroundImage.layer.cornerRadius = backgroundImage.frame.size.height/2
        backgroundImage.layer.masksToBounds = true;
        backgroundImage.layer.borderWidth = 3;
        backgroundImage.layer.borderColor = UIColor.whiteColor().CGColor!
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.text = title
    }
}