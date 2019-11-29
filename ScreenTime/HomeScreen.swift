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


class HomeScreen: UIViewController {

    @IBOutlet weak var randomizerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //adds games from methods below to arrays
        basicGames = createBasicGames()
        advancedGames = createAdvancedGames()
        overallGames += basicGames
        overallGames += advancedGames
        
    }
    //big randomizer wheel at the home screen logic
    @IBAction func homeRandomizerPressed(_ sender: Any) {
        overallCurrentGame = overallGames[Int.random(in: 0...(overallGames.count)-1)]
        performSegue(withIdentifier: "random", sender: self)
    }
    
    //adds games to basicGames array
    func createBasicGames() ->[Game]{
        
        var tempGames: [Game] = []
        var index = 0
        
        tempGames.append(Game(catagory: "Test", title: "EasyTest", video: "Test", difficulty: "Easy", playerAmountLow: 1, playerAmountHigh: 6, materials: "testmaterials", rules: "testrules", favorite: false, gameIndex: index))
        //must have the line below
        index += 1
        
        tempGames.append(Game(catagory: "Test", title: "EasyTest2", video: "Test", difficulty: "Easy", playerAmountLow: 1, playerAmountHigh: 6, materials: "testmaterials", rules: "testrules", favorite: false, gameIndex: index))
        index += 1
        
        return tempGames
        
    }
    
    //adds games to advancedGames array
    func createAdvancedGames() ->[Game]{
        
        var tempGames: [Game] = []
        var index = 0
        
        tempGames.append(Game(catagory: "Test", title: "AdvancedTest", video: "Test", difficulty: "Easy", playerAmountLow: 3, playerAmountHigh: 4, materials: "testmaterials", rules: "testrules", favorite: false, gameIndex: index))
        //must have the line below
        index += 1
        
        tempGames.append(Game(catagory: "Test", title: "AdvancedTest2", video: "Test", difficulty: "Medium", playerAmountLow: 5, playerAmountHigh: 0, materials: "testmaterials2", rules: "testrules2", favorite: false, gameIndex: index))
        index += 1
        
        return tempGames
    }
    

}

