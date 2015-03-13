//
//  DashboardViewController.swift
//  justplaysingle
//
//  Created by Zack Field on 3/11/15.
//  Copyright (c) 2015 Zack Field. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, walletUpdateDelegate, pointUpdateDelegate {
    
    var wallet = Wallet()
    var pointBank = PointBank()
    
    let mainColor:UIColor = UIColor(red: 222.0/255, green: 59.0/255, blue: 47.0/255, alpha: 1.0)
    let fontName:NSString = "Avenir-Book"
    let boldFontName:NSString = "Avenir-Black"
    
    @IBOutlet weak var walletBalance: UILabel!
    @IBOutlet weak var pointsBalance: UILabel!
    @IBOutlet weak var creditsLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var walletButton: UIButton!
    @IBOutlet weak var bankButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let labelFont:UIFont = UIFont(name: boldFontName, size: 20.0)!
        
        let gradient = CAGradientLayer().turquoiseColor()
        gradient.frame = self.view.bounds
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        self.creditsLabel.textColor =  UIColor.whiteColor()
        self.creditsLabel.font =  labelFont
        self.creditsLabel.text = "Credits"
        
        self.walletBalance.textColor =  UIColor.whiteColor()
        self.walletBalance.font =  labelFont
        
        self.pointsLabel.textColor =  UIColor.whiteColor()
        self.pointsLabel.font =  labelFont
        self.pointsLabel.text = "Points"
        
        self.pointsBalance.textColor =  UIColor.whiteColor()
        self.pointsBalance.font =  labelFont
        
        
        self.playButton.backgroundColor = UIColor.clearColor()
        self.playButton.layer.cornerRadius = 8.0
        self.playButton.layer.borderColor = UIColor.whiteColor().CGColor!
        self.playButton.layer.borderWidth = 1.0
        self.playButton.titleLabel?.font = UIFont(name: boldFontName, size: 20.0)
        self.playButton.setTitle("PLAY", forState: UIControlState.Normal)
        self.playButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.playButton.setTitleColor(UIColor(white: 1.0, alpha: 0.5), forState: UIControlState.Highlighted)
        
        self.walletButton.backgroundColor = UIColor.clearColor()
        self.walletButton.layer.cornerRadius = 8.0
        self.walletButton.layer.borderColor = UIColor.whiteColor().CGColor!
        self.walletButton.layer.borderWidth = 1.0
        self.walletButton.titleLabel?.font = UIFont(name: boldFontName, size: 20.0)
        self.walletButton.setTitle("WALLET", forState: UIControlState.Normal)
        self.walletButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.walletButton.setTitleColor(UIColor(white: 1.0, alpha: 0.5), forState: UIControlState.Highlighted)
        
        self.bankButton.backgroundColor = UIColor.clearColor()
        self.bankButton.layer.cornerRadius = 8.0
        self.bankButton.layer.borderColor = UIColor.whiteColor().CGColor!
        self.bankButton.layer.borderWidth = 1.0
        self.bankButton.titleLabel?.font = UIFont(name: boldFontName, size: 20.0)
        self.bankButton.setTitle("BANK", forState: UIControlState.Normal)
        self.bankButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.bankButton.setTitleColor(UIColor(white: 1.0, alpha: 0.5), forState: UIControlState.Highlighted)
        self.configureView()
        
    }
    
    func configureView() {
        if let label = self.walletBalance {
            label.text = String(wallet.getBalance())
        }
        if let label = self.pointsBalance {
            label.text = String(pointBank.getBalance())
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let id:String = segue.identifier as String!
        switch id {
        case "showPlay":
            println("going to play screen")
            let controller = (segue.destinationViewController as UINavigationController).topViewController as PlayViewController
            controller.wallet = self.wallet
            controller.bank = self.pointBank
            controller.walletDelegate = self
            controller.pointsDelegate = self
        case "showWallet":
            println("going to wallet screen")
            let controller = (segue.destinationViewController as UINavigationController).topViewController as WalletViewController
            controller.wallet = self.wallet
            controller.delegate = self
        case "showBank":
            println("going to bank screen")
            let controller = (segue.destinationViewController as UINavigationController).topViewController as BankViewController
            controller.bank = self.pointBank
        default:
            println("going to unknown screen")
        }
    }
    
    func walletUpdate(wallet: Wallet) {
        self.wallet.setBalance(wallet.getBalance())
        self.configureView()
    }
    
    func pointUpdate(bank: PointBank) {
        self.pointBank.setBalance(bank.getBalance())
        self.configureView()
    }

}
