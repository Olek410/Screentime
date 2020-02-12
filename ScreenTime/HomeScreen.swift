//
//  HomeScreen.swift
//  ScreenTime
//
//  Created by BigOof on 11/29/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import Foundation
import UIKit

//the game object for the randomizer button(only for the home screen)
var overallCurrentGame: Game!
//combines all games into 1 array for randomizer
var overallGames: [Game] = []
//needed for Codable protocol
let defaults = UserDefaults.standard

var backsegueIdentifier = 1

class HomeScreen: UIViewController {
    

    @IBOutlet weak var randomizerButton: UIButton!
    @IBOutlet weak var InfoScreenView: UIView!
    @IBOutlet weak var InfoIcon: UIButton!
    @IBOutlet weak var Info: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        Info.text = "Play Outlet is a collection of fun activities, from tag to checkers, to help you get away from screens. You can learn and enjoy many classic activities on this app!\n\nHow to use:\n\n1. Select an age group to sort activities by difficulty/age-group or press the big wheel on the home screen to get straight to a random activity.\n\n2. Both age group will bring you to a list of activities. Each one has an icon (to show what type of game it is), a simple description, and the materials and number of people needed. You can also click the heart icon to favorite activities!\n\n3. When you tap an activity, it will give you more information such as instructions and more materials. Some activities will even have a video too!\n\n4. Simple icons at the bottom are used to navigate between age groups, home screen, and random activities.\n\nYou can shake the device to get a new random game"
        
        //Uncomment this to reset persistent data
        /*createGames()
        encodeDataOverall()
        encodeDataBasic()
        encodeDataAdvanced()*/
        
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
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            backsegueIdentifier = 1
            overallCurrentGame = overallGames[Int.random(in: 0...(overallGames.count)-1)]
            performSegue(withIdentifier: "random", sender: self)
        }
    }
    //big randomizer wheel at the home screen logic
    @IBAction func homeRandomizerPressed(_ sender: Any) {
        backsegueIdentifier = 1
        overallCurrentGame = overallGames[Int.random(in: 0...(overallGames.count)-1)]
        performSegue(withIdentifier: "random", sender: self)
    }
    
    @IBAction func InfoIconPress(_ sender: Any) {
        InfoScreenView.isHidden = false
    }
    
    @IBAction func InfoScreenViewClose(_ sender: Any) {
        InfoScreenView.isHidden = true
    }
    
    
}

