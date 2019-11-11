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
    @IBOutlet weak var difficulty: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var requirements: UILabel!
    @IBOutlet weak var favorite: UIImageView!
    @IBOutlet weak var playerIcon: UIImageView!
    @IBOutlet weak var players: UILabel!
    
    
    func setGame(tempGame:Game){
        catagoryImage.image = UIImage(named: String(tempGame.catagory))
        difficulty.image = UIImage(named: String(tempGame.difficulty))
        gameName.text = tempGame.title
        requirements.text = tempGame.materials
        favorite.image = UIImage(named: String(tempGame.favorite))
        playerIcon.image = UIImage(named: "PlayerIcon") //playericon is a static image
        players.text = tempGame.playerAmountString //player amount range
    }
    
}
