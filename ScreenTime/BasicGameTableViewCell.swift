//
//  BasicGameTableViewCell.swift
//  ScreenTime
//
//  Created by Olivier Balazy on 11/22/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import UIKit

class BasicGameTableViewCell: UITableViewCell {

  
    @IBOutlet weak var catagoryImage: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var requirements: UILabel!
    @IBOutlet weak var favorite: UIImageView!
    @IBOutlet weak var playerIcon: UIImageView!
    @IBOutlet weak var players: UILabel!
    @IBOutlet weak var cellTouch: UIButton!
    @IBOutlet weak var difficultyOutlet: UILabel!
    
    var gameIndex = 0
    
    @IBAction func favoritePressed(_ sender: Any) {
        advancedGames[gameIndex].favorite = !advancedGames[gameIndex].favorite
        favorite.image = UIImage(named: String("heart\(advancedGames[gameIndex].favorite)"))
    }
    
    @IBAction func AdvancedGameCellPressed(_ sender: Any) {
        currentIndex=gameIndex
        updateGame()
        
    }
    func setGame(tempGame:Game){
        catagoryImage.image = UIImage(named: String(tempGame.catagory))
        difficultyOutlet.text = tempGame.difficulty
        gameName.text = tempGame.title
        requirements.text = tempGame.materials
        favorite.image = UIImage(named: String("heart\(tempGame.favorite)"))
        playerIcon.image = UIImage(named: "PlayerIcon") //playericon is a static image
        players.text = tempGame.playerAmountString //player amount range
        self.gameIndex = tempGame.gameIndex
    }
    
}
