//
//  Game.swift
//  ScreenTime
//
//  Created by BigOof on 11/10/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import Foundation
import UIKit

class Game{
    
    var catagory: String
    var title: String
    var video: String
    var difficulty: Int
    var playerAmountLow: Int
    var playerAmountHigh: Int
    var materials: String
    var rules: String
    var favorite: Bool
    
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
    }
    
}
