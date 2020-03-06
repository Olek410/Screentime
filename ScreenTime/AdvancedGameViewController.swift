//
//  AdvancedGameViewController.swift
//  ScreenTime
//
//  Created by BigOof on 11/10/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import UIKit

//current game index to be used for detailsegue
var advancedCurrentIndex = 0

var advancedCurrentGame: Game!
var advancedGames: [Game] = []

//add more games in homescreen file

class AdvancedGameViewController: UIViewController {
    
    //link the table inside the view
    @IBOutlet weak var AdvancedTableView: UITableView!
    @IBOutlet weak var advancedRandomizerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalPresentationStyle = UIModalPresentationStyle.fullScreen

        AdvancedTableView.delegate = self
        AdvancedTableView.dataSource = self
        
    }
    /*override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            backsegueIdentifier = 3
            overallCurrentGame = advancedGames[Int.random(in: 0...(advancedGames.count)-1)]
            performSegue(withIdentifier: "advancedRandomizer", sender: self)
        }
    }*/
    //small randomizer wheel logic
    @IBAction func advancedRandomizer(_ sender: Any) {
        backsegueIdentifier = 3
        overallCurrentGame = advancedGames[Int.random(in: 0...(advancedGames.count)-1)]
    }
    
    @IBAction func addCustomGame(_ sender: Any) {
        backsegueIdentifier = 3
        newGameBoolean = true
    }
    
}
    extension AdvancedGameViewController: UITableViewDataSource, UITableViewDelegate{
        
        //sets cell height
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 180
        }
        
        //sets number of cells
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return advancedGames.count
        }
        
        //shows cells(creates cells)
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let game = advancedGames[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdvancedGameCell") as! AdvancedGameTableViewCell
            
            cell.setGame(tempGame: game)
            
            
            return cell
            
        }
}

