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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalPresentationStyle = UIModalPresentationStyle.fullScreen

        AdvancedTableView.delegate = self
        AdvancedTableView.dataSource = self
        
    }
    
    //small randomizer wheel logic
    @IBAction func advancedRandomizer(_ sender: Any) {
        overallCurrentGame = advancedGames[Int.random(in: 0...(advancedGames.count)-1)]
        performSegue(withIdentifier: "advancedRandomizer", sender: self)
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

