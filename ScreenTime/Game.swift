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
struct Game: Codable{
    
    var catagory: String //game catagory out of 4, card, strategy, outside, and dice
    var title: String //name of the game
    var video: String //video link
    var image: String
    var difficulty: String //difficulty word, easy medium hard
    var playerAmountLow: Int //player amount low end
    var playerAmountHigh: Int //player amount high end
    var materials: String //needed materials
    var rules: String //rules
    var favorite: Bool //favorited or not(heart icon)
    var playerAmountString: String
    
    var gameIndex: Int
    
    init(catagory: String, title: String, video: String, image: String, difficulty: String, playerAmountLow: Int, playerAmountHigh: Int, materials: String, rules: String, favorite: Bool, gameIndex: Int) {
        self.catagory = catagory
        self.title = title
        self.video = video
        self.image = image
        self.difficulty = difficulty
        self.playerAmountLow = playerAmountLow
        self.playerAmountHigh = playerAmountHigh
        self.materials = materials
        self.rules = rules
        self.favorite = favorite
        self.gameIndex = gameIndex
        
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



