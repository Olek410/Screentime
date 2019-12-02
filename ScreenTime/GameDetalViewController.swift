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
    
    @IBOutlet var video: WKWebView!
    @IBOutlet weak var playButton: UIButton!
    
    //starts video
    @IBAction func playButtonPressed(_ sender: Any) {
        playButton.isHidden = true
        video.load(URLRequest(url: URL(string: overallCurrentGame.video)!))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playButton.isHidden = false
        
        //sets webview url to game object video variable
        gameTitle.text = overallCurrentGame.title
        
        materialsInfo.text = overallCurrentGame.materials
        
        numberOfPlayers.text = "Number of Players: \(overallCurrentGame.playerAmountString)"
        
        rulesInfo.text = overallCurrentGame.rules
    }

        
    
    
}
    

