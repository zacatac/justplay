//
//  PlayViewController.swift
//  justplaysingle
//
//  Created by Zack Field on 3/11/15.
//  Copyright (c) 2015 Zack Field. All rights reserved.
//

import UIKit


class PlayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var walletDelegate: walletUpdateDelegate?
    var pointsDelegate: pointUpdateDelegate?
    var wallet: Wallet? {
        didSet {
            self.configureView()
        }
    }
    var bank: PointBank? {
        didSet {
            self.configureView()
        }
    }
    var games: [(String, String)] = [
        ("Flappy Bird", "flappy.png"),
        ("Time Crisis", "time-crisis.jpg"),
        ("ET", "flappy.png")
    ]

    @IBOutlet weak var creditsLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var bankLabel: UILabel!
    @IBOutlet weak var gamesTable: UITableView!

    let mainColor:UIColor = UIColor(red: 222.0/255, green: 59.0/255, blue: 47.0/255, alpha: 1.0)
    let fontName:NSString = "Avenir-Book"
    let boldFontName:NSString = "Avenir-Black"
    let img = UIImage(named: "flappy.png")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var nib = UINib(nibName: "GameTableViewCell", bundle: nil)
        let labelFont:UIFont = UIFont(name: boldFontName, size: 20.0)!
        self.balanceLabel.textColor =  UIColor.whiteColor()
        self.balanceLabel.font =  labelFont
        
        self.gamesTable.layer.backgroundColor = UIColor.clearColor().CGColor!
        self.gamesTable.registerNib(nib, forCellReuseIdentifier: "cell")
        self.gamesTable.separatorColor = UIColor.clearColor()
        
        let gradient = CAGradientLayer().turquoiseColor()
        gradient.frame = self.view.bounds
        self.view.layer.insertSublayer(gradient, atIndex: 0)

        self.creditsLabel.textColor =  UIColor.whiteColor()
        self.creditsLabel.font =  labelFont
        self.creditsLabel.text = "Credits"
        
        self.balanceLabel.textColor =  UIColor.whiteColor()
        self.balanceLabel.font =  labelFont
        
        self.pointsLabel.textColor =  UIColor.whiteColor()
        self.pointsLabel.font =  labelFont
        self.pointsLabel.text = "Points"
        
        self.bankLabel.textColor =  UIColor.whiteColor()
        self.bankLabel.font =  labelFont
        
        self.configureView()
    }

    func configureView() {
        if let wallet: Wallet = self.wallet {
            if let label = self.balanceLabel {
                label.text = String(wallet.getBalance())
            }
        }
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

    override func viewWillDisappear(animated: Bool) {
        walletDelegate?.walletUpdate(self.wallet!)
        pointsDelegate?.pointUpdate(self.bank!)
    }
    
    
    
    func withdrawCredit(sender: AnyObject?){
        let rtn = self.wallet?.withdraw(1)
        if rtn > 0 {
            self.bank?.deposit(1000)
            self.performSegueWithIdentifier("playGame", sender: sender)
        }
        self.configureView()
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let gameId:String = segue.identifier as String!
        
    }
    
    // MARK: - Table View
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.games.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: GameTableViewCell = self.gamesTable.dequeueReusableCellWithIdentifier("cell") as GameTableViewCell
        var (title, image) = self.games[indexPath.row]
        cell.loadItem(title, image: image)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
        var (title, image) = self.games[indexPath.row]
        self.withdrawCredit(title)
    }
    
    
}
