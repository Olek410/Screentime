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

var persistingData: [PersistingData] = []

//Keeps data if items are shown for the first time
struct PersistingData: Codable{
    
    var homeScreenInfo: Bool
    
    init(homeScreenInfo: Bool) {
        self.homeScreenInfo = homeScreenInfo
    }
    
}

func encodePersistingData(){
    defaults.set(try? PropertyListEncoder().encode(persistingData), forKey: "PersistingData")
}

func decodePersistingData()->[PersistingData]{
    guard let persistingData = defaults.object(forKey: "PersistingData") as? Data else{
        return []
    }
    
    guard let persistingDataExport = try? PropertyListDecoder().decode([PersistingData].self, from: persistingData) else {
        return []
    }
    
    return persistingDataExport
    
}

class HomeScreen: UIViewController {
    

    @IBOutlet weak var randomizerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(decodePersistingData().count == 0){
            persistingData = [PersistingData(homeScreenInfo: false)]
        }
        
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

