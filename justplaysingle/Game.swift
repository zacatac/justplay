//
//  Game.swift
//  justplay
//
//  Created by Zack Field on 3/13/15.
//  Copyright (c) 2015 Zack Field. All rights reserved.
//

class Game {
    let name:String = ""
    let minTokens:Int = 1
    
    var points:Int = 0
    var addedCredits = 0
    
    func getName() -> String {
        return self.name
    }
    
    func getMinTokens() -> Int {
        return self.minTokens
    }
    
    func getAddedCredits() -> Int {
        return self.addedCredits
    }
    
    func addPoints(p: Int) {
        assert(p >= 0, "p must be nonnegative")
        self.points += p
    }
    
    func resetPoints() {
        self.points = 0
    }
    
    func addCredits(c: Int) {
        assert(c >= 0, "c must be nonnegative")
        self.addedCredits += c
    }
    
    
    
    
}
