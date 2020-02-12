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
    
    //heart pressed
    @IBAction func favoritePressed(_ sender: Any) {
        basicGames[gameIndex].favorite = !basicGames[gameIndex].favorite
        favorite.image = UIImage(named: String("heart\(basicGames[gameIndex].favorite)"))
        encodeDataBasic()
    }
    //cell is pressed
    @IBAction func BasicGameCellPressed(_ sender: Any) {
        backsegueIdentifier = 2
        basicCurrentIndex = gameIndex
        basicCurrentGame = basicGames[basicCurrentIndex]
        overallCurrentGame = basicCurrentGame
        
    }
    //sets labels and images to game object variables
    func setGame(tempGame:Game){
        catagoryImage.image = UIImage(named: String(tempGame.catagory))
        difficultyOutlet.text = tempGame.difficulty
        gameName.text = tempGame.title
        requirements.text = tempGame.materials
        favorite.image = UIImage(named: String("heart\(tempGame.favorite)"))
        playerIcon.image = UIImage(named: "playerIcon") //playericon is a static image
        players.text = tempGame.playerAmountString //player amount range
        self.gameIndex = tempGame.gameIndex
    }
    
}
