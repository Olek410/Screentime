//
//  AdvancedGameViewController.swift
//  ScreenTime
//
//  Created by BigOof on 11/10/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import UIKit

var advancedCurrentIndex = 0 //current game index to be used for detailsegue
var advancedCurrentGame: Game!
var advancedGames: [Game] = []

func updateGame(){
    advancedCurrentGame = advancedGames[advancedCurrentIndex]
}

class AdvancedGameViewController: UIViewController {
    
     //game array for this controller
    
    //link the table inside the view
    @IBOutlet weak var AdvancedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        advancedGames = createGames()
        
        AdvancedTableView.delegate = self
        AdvancedTableView.dataSource = self
        
    }
    
    func createGames() ->[Game]{
        
        var tempGames: [Game] = []
        
        //create more games below
        tempGames.append(Game(catagory: "Test", title: "Test", video: "Test", difficulty: "Easy", playerAmountLow: 3, playerAmountHigh: 4, materials: "testmaterials", rules: "testrules", favorite: false, gameIndex: 0))
        
        tempGames.append(Game(catagory: "Test", title: "Test2", video: "Test", difficulty: "Medium", playerAmountLow: 5, playerAmountHigh: 0, materials: "testmaterials2", rules: "testrules2", favorite: false, gameIndex: 1))
        
        return tempGames
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
        
        //shows cells
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let game = advancedGames[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdvancedGameCell") as! AdvancedGameTableViewCell
            
            cell.setGame(tempGame: game)
            
            
            return cell
            
        }
}

