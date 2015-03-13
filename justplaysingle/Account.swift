//
//  Account.swift
//  justplaysingle
//
//  Created by Zack Field on 3/12/15.
//  Copyright (c) 2015 Zack Field. All rights reserved.
//

class Account {
    var balance:Int = 0
    
    func getBalance() -> Int {
        return balance
    }
    
    func setBalance(val: Int){
        assert(val >= 0, "val must be nonnegative")
        balance = val
    }
    
    func deposit(val:Int) {
        assert(val >= 0, "val must be nonnegative")
        self.balance += val
    }
    
    func withdraw(val:Int) -> Int{
        assert(val > 0, "val must be positive")
        if self.balance - val >= 0 {
            self.balance -= val
            return val
        } else {
            return 0
        }
    }
}
