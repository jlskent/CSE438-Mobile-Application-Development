//
//  President.swift
//  PresidentialApproval
//
//  Created by Todd Sproull on 9/11/17.
//  Copyright © 2017 Todd Sproull. All rights reserved.
//

import Foundation

class Pet {
    
    enum PolitcalParty {
        case Cat
        case Dog
        case Bunny
        case Bird
        case Fish
        
    }
    
    //Data
    private (set)  var happinessValue:Double = 50
//    private (set)  var happinessCat:Double
//    private (set)  var happinessBird:Double
//    private (set)  var happinessBunny:Double
//    private (set)  var happinessFish:Double

    
    private (set)  var foodLevel:Double = 50
//    private (set)  var foodLevelCat:Double
//    private (set)  var foodLevelBird:Double
//    private (set)  var foodLevelBunny:Double
//    private (set)  var foodLevelFish:Double
    
      var name:String
    private  var partyAffiliation:PolitcalParty
    
    
    
    //Behavior
    func makeAmericaGreatAgain() {
        happinessValue = happinessValue + 1
        if(happinessValue > 100){
            happinessValue = 100
        }
    }
    

//    feed
    
    func tweet() {
        foodLevel += 1
        if(foodLevel > 100){
            foodLevel = 100
        }

    }
    

    
    //Init
    
    init(name: String, party: PolitcalParty) {
        self.name = name
        self.partyAffiliation = party
//        self.happinessValue = 50
//        self.foodLevel = 50
//        happinessCat = 50
//        happinessFish = 50
//        happinessBird = 50
//        happinessBunny = 50
//        foodLevelFish = 50
//        foodLevelBunny = 50
//        foodLevelBird = 50
//        foodLevelCat = 50


        
    }
    
}
