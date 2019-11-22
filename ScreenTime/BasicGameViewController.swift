//
//  BasicGameViewController.swift
//  ScreenTime
//
//  Created by Olivier Balazy on 11/22/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import UIKit

var basicCurrentIndex = 0 //current game index to be used for detailsegue
var basicCurrentGame: Game!
var basicGames: [Game] = []

func basicupdateGame(){
    basicCurrentGame = basicGames[basicCurrentIndex]
}

class BasicGameViewController: UIViewController {

    
    @IBOutlet weak var BasicTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        basicGames = createGames()
        
        BasicTableView.delegate = self
        BasicTableView.dataSource = self
        
    }
    
    func createGames() ->[Game]{
        
        var tempGames: [Game] = []
        
        tempGames.append(Game(catagory: "Test", title: "EasyTest", video: "Test", difficulty: "Easy", playerAmountLow: 1, playerAmountHigh: 6, materials: "testmaterials", rules: "testrules", favorite: false, gameIndex: 0))
        
        return tempGames
        
    }

}

extension BasicGameViewController: UITableViewDataSource, UITableViewDelegate{
    
    //sets cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    //sets number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basicGames.count
    }
    
    //shows cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let game = basicGames[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicGameCell") as! BasicGameTableViewCell
        
        cell.setGame(tempGame: game)
        
        
        return cell
        
    }
}
