//
//  WalletViewController.swift
//  justplaysingle
//
//  Created by Zack Field on 3/12/15.
//  Copyright (c) 2015 Zack Field. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController {
    
    var delegate: walletUpdateDelegate?
    var wallet: Wallet? {
        didSet {
            self.configureView()
        }
    }

    let boldFontName:NSString = "Avenir-Black"

    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var balanceTitle: UILabel!
    @IBOutlet weak var addSingleCreditButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let labelFont:UIFont = UIFont(name: boldFontName, size: 20.0)!
        
        let gradient = CAGradientLayer().turquoiseColor()
        gradient.frame = self.view.bounds
        self.view.layer.insertSublayer(gradient, atIndex: 0)

        self.balanceTitle.textColor =  UIColor.whiteColor()
        self.balanceTitle.font =  labelFont
        self.balanceTitle.text = "Credits"
        
        self.balanceLabel.textColor =  UIColor.whiteColor()
        self.balanceLabel.font =  labelFont

        
        self.addSingleCreditButton.backgroundColor = UIColor.clearColor()
        self.addSingleCreditButton.layer.cornerRadius = 8.0
        self.addSingleCreditButton.layer.borderColor = UIColor.whiteColor().CGColor!
        self.addSingleCreditButton.layer.borderWidth = 1.0
        self.addSingleCreditButton.titleLabel?.font = UIFont(name: boldFontName, size: 20.0)
        self.addSingleCreditButton.setTitle("ADD CREDIT", forState: UIControlState.Normal)
        self.addSingleCreditButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.addSingleCreditButton.setTitleColor(UIColor(white: 1.0, alpha: 0.5), forState: UIControlState.Highlighted)
        
        self.configureView()
    }

    func configureView(){
        // Update user interface with latest wallet information
        if let wallet: Wallet = self.wallet {
            if let label = self.balanceLabel {
                label.text = String(wallet.getBalance())
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addCredit(sender: AnyObject) {
        self.wallet?.deposit(1)
        self.configureView()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillDisappear(animated: Bool) {
        delegate?.walletUpdate(self.wallet!)
    }

}
