//
//  Game.swift
//  ScreenTime
//
//  Created by BigOof on 11/10/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import Foundation
import UIKit


//Creates new game object
class Game{
    
    var catagory: String //game catagory out of 4, card, strategy, outside, and dice
    var title: String //name of the game
    var video: String //video link
    var difficulty: Int //difficulty meter from 1-10, images based off the number
    var playerAmountLow: Int //player amount low end
    var playerAmountHigh: Int //player amount high end
    var materials: String //needed materials
    var rules: String //rules
    var favorite: Bool //favorited or not(heart icon)
    var playerAmountString: String
    
    init(catagory: String, title: String, video: String, difficulty: Int, playerAmountLow: Int, playerAmountHigh: Int, materials: String, rules: String, favorite: Bool) {
        self.catagory = catagory
        self.title = title
        self.video = video
        self.difficulty = difficulty
        self.playerAmountLow = playerAmountLow
        self.playerAmountHigh = playerAmountHigh
        self.materials = materials
        self.rules = rules
        self.favorite = favorite
        
        //logic for playerAmountString
        if(playerAmountHigh==0){//to indicate plus, example: 2+, 8+
            self.playerAmountString = "\(playerAmountLow)+"
        }
        else if(playerAmountLow==playerAmountHigh){//to get rid of "-"
            self.playerAmountString = "\(playerAmountLow)"
        }
        else{//standard
            self.playerAmountString = "\(playerAmountLow)-\(playerAmountHigh)"
        }
    }
    
}
