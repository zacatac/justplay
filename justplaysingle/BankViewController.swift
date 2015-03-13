//
//  BankViewController.swift
//  justplaysingle
//
//  Created by Zack Field on 3/12/15.
//  Copyright (c) 2015 Zack Field. All rights reserved.
//

import UIKit

class BankViewController: UIViewController {

    var bank: PointBank? {
        didSet {
            self.configureView()
        }
    }
    
    let boldFontName:NSString = "Avenir-Black"
    
    @IBOutlet weak var bankLabel: UILabel!
    @IBOutlet weak var bankTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let labelFont:UIFont = UIFont(name: boldFontName, size: 20.0)!
        
        let gradient = CAGradientLayer().turquoiseColor()
        gradient.frame = self.view.bounds
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        self.bankTitle.textColor =  UIColor.whiteColor()
        self.bankTitle.font =  labelFont
        self.bankTitle.text = "Points"
        
        self.bankLabel.textColor =  UIColor.whiteColor()
        self.bankLabel.font =  labelFont
        
        self.configureView()
    }

    func configureView(){
        if let bank: PointBank = self.bank {
            if let label = self.bankLabel {
                label.text = String(bank.getBalance())
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
