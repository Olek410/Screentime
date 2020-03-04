//
//  BasicGameViewController.swift
//  ScreenTime
//
//  Created by Olivier Balazy on 11/22/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import UIKit

//current game index to be used for detailsegue
var basicCurrentIndex = 0

var basicCurrentGame: Game!
var basicGames: [Game] = []

//add more games in homescreen file

class BasicGameViewController: UIViewController {

    
    @IBOutlet weak var BasicTableView: UITableView!
    @IBOutlet weak var basicRandomizerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        BasicTableView.delegate = self
        BasicTableView.dataSource = self
        
    }
    /*override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            backsegueIdentifier = 2
            overallCurrentGame = basicGames[Int.random(in: 0...(basicGames.count)-1)]
            performSegue(withIdentifier: "basicRandomizer", sender: self)
        }
    }*/
    //small randomizer wheel at basic screen logic
    @IBAction func basicRandomizer(_ sender: Any) {
        backsegueIdentifier = 2
        overallCurrentGame = basicGames[Int.random(in: 0...(basicGames.count)-1)]
        performSegue(withIdentifier: "basicRandomizer", sender: self)
    }
    

    @IBAction func addCustomGame(_ sender: Any) {
        backsegueIdentifier = 2
        newGameBoolean = true
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
    
    //shows cells(creates cells)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let game = basicGames[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicGameCell") as! BasicGameTableViewCell
        
        cell.setGame(tempGame: game)
        
        
        return cell
        
    }
}
