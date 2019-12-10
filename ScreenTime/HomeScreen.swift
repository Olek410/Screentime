//
//  HomeScreen.swift
//  ScreenTime
//
//  Created by BigOof on 11/29/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import UIKit

//the game object for the randomizer button(only for the home screen)
var overallCurrentGame: Game!
//combines all games into 1 array for randomizer
var overallGames: [Game] = []
//needed for Codable protocol
let defaults = UserDefaults.standard

class HomeScreen: UIViewController {
    

    @IBOutlet weak var randomizerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(decodeDataOverall().count == 0){
            createGames()
            encodeDataOverall()
            encodeDataBasic()
            encodeDataAdvanced()
        }
        
        overallGames = decodeDataOverall()
        basicGames = decodeDataBasic()
        advancedGames = decodeDataAdvanced()
    }
    //big randomizer wheel at the home screen logic
    @IBAction func homeRandomizerPressed(_ sender: Any) {
        overallCurrentGame = overallGames[Int.random(in: 0...(overallGames.count)-1)]
        performSegue(withIdentifier: "random", sender: self)
    }
    

}

