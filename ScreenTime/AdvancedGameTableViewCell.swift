//
//  AdvancedGameTableViewCell.swift
//  ScreenTime
//
//  Created by BigOof on 11/10/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import UIKit

class AdvancedGameTableViewCell: UITableViewCell {

    //All outlets of the advnaced version game cell
    
    @IBOutlet weak var catagoryImage: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var requirements: UILabel!
    @IBOutlet weak var favorite: UIImageView!
    @IBOutlet weak var playerIcon: UIImageView!
    @IBOutlet weak var players: UILabel!
    @IBOutlet weak var cellTouch: UIButton!
    @IBOutlet weak var difficultyOutlet: UILabel!
    @IBOutlet weak var editIcon: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    
    var gameIndex = 0
    
    //heart pressed
    @IBAction func favoritePressed(_ sender: Any) {
        advancedGames[gameIndex].favorite = !advancedGames[gameIndex].favorite
        favorite.image = UIImage(named: String("heart\(advancedGames[gameIndex].favorite)"))
        encodeDataAdvanced()
    }
    //cell is pressed
    @IBAction func AdvancedGameCellPressed(_ sender: Any) {
        backsegueIdentifier = 3
        advancedCurrentIndex = gameIndex
        advancedCurrentGame = advancedGames[advancedCurrentIndex]
        overallCurrentGame = advancedCurrentGame

    }
    @IBAction func AdvancedGameCustomPressed(_ sender: Any) {
        newGameBoolean = false
        backsegueIdentifier = 3
        advancedCurrentIndex = gameIndex
        advancedCurrentGame = advancedGames[advancedCurrentIndex]
        overallCurrentGame = advancedCurrentGame
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
        
        if tempGame.editable{
            editIcon.isHidden = false
            editButton.isHidden = false
            catagoryImage.isHidden = true
        }
        else{
            editIcon.isHidden = true
            editButton.isHidden = true
            catagoryImage.isHidden = false
        }
    }
    
}
