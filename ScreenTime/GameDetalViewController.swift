//
//  AdvancedGameDetalViewController.swift
//  ScreenTime
//
//  Created by BigOof on 11/11/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import UIKit
import WebKit

class GameDetalViewController: UIViewController {

    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var materialsInfo: UILabel!
    @IBOutlet weak var numberOfPlayers: UILabel!
    @IBOutlet weak var rulesInfo: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        imageView.image = UIImage(named: overallCurrentGame.image)
        
        gameTitle.text = overallCurrentGame.title
        
        materialsInfo.text = overallCurrentGame.materials
        
        numberOfPlayers.text = "Number of Players: \(overallCurrentGame.playerAmountString)"
        
        rulesInfo.text = overallCurrentGame.rules
    }

        
    
    
}
    

