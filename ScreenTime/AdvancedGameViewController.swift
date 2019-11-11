//
//  AdvancedGameViewController.swift
//  ScreenTime
//
//  Created by BigOof on 11/10/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import UIKit

class AdvancedGameViewController: UIViewController {

    
    
    //game array for this controller
    var games: [Game] = []

    //link the table inside the view
    @IBOutlet weak var AdvancedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        games = createGames()
        
        AdvancedTableView.delegate = self
        AdvancedTableView.dataSource = self
    }
    
    func createGames() ->[Game]{
        
        var tempGames: [Game] = []
        
        //create more games below
        tempGames.append(Game(catagory: "Test", title: "Test", video: "Test", difficulty: 1, playerAmountLow: 3, playerAmountHigh: 4, materials: "testmaterials", rules: "testrules", favorite: false))
        
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
            return games.count
        }
        
        //shows cells
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let game = games[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdvancedGameCell") as! AdvancedGameTableViewCell
            
            cell.setGame(tempGame: game)
            
            return cell
            
        }
}

