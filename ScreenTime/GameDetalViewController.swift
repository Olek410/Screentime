//
//  AdvancedGameDetalViewController.swift
//  ScreenTime
//
//  Created by BigOof on 11/11/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import UIKit
import WebKit

class GameDetalViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var materialsInfo: UILabel!
    @IBOutlet weak var numberOfPlayers: UILabel!
    @IBOutlet weak var rulesInfo: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addPlayer: UIButton!
    
    @IBOutlet var scoreCellsUI: [UIView]!
    
    @IBOutlet var scoreCellName: [UITextField]!
    @IBOutlet var scoreCellScore: [UILabel]!
    
    @IBOutlet weak var TotalView: UIView!
    
    var currentPlayerAmount = 0
    
    struct playerScoreCell {
        var name: String
        var score: Int
        var hidden: Bool
        var index: Int
    }
    
    var playerScores: [playerScoreCell] = []
    
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            switch backsegueIdentifier {
            case 1:
                overallCurrentGame = overallGames[Int.random(in: 0...(overallGames.count)-1)]
            case 2:
                overallCurrentGame = basicGames[Int.random(in: 0...(basicGames.count)-1)]
            case 3:
                overallCurrentGame = advancedGames[Int.random(in: 0...(advancedGames.count)-1)]
            default:
                overallCurrentGame = overallGames[Int.random(in: 0...(overallGames.count)-1)]
            }
            
            
            reloadView()
        }
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        pushScoreName(index: textField.tag,text: textField.text ?? "")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        pushScoreName(index: textField.tag,text: textField.text ?? "")
        return true
    }
    
    func reloadView(){
        
        currentPlayerAmount = 0
        playerScores = []
        
        imageView.image = UIImage(named: overallCurrentGame.image)
        
        gameTitle.text = overallCurrentGame.title
        
        materialsInfo.text = overallCurrentGame.materials
        
        numberOfPlayers.text = "Number of Players: \(overallCurrentGame.playerAmountString)"
        
        rulesInfo.text = overallCurrentGame.rules
        
        for i in 0...4 {
            scoreCellName[i].delegate = self
            playerScores.append(playerScoreCell(name: "", score: 0, hidden: true, index: i))
        }
        hideScoreCells()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerScores = []
        
        modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        imageView.image = UIImage(named: overallCurrentGame.image)
        
        gameTitle.text = overallCurrentGame.title
        print(overallCurrentGame.title)
        
        materialsInfo.text = overallCurrentGame.materials
        
        numberOfPlayers.text = "Number of Players: \(overallCurrentGame.playerAmountString)"
        
        rulesInfo.text = overallCurrentGame.rules
        
        for i in 0...4 {
            scoreCellName[i].delegate = self
            playerScores.append(playerScoreCell(name: "", score: 0, hidden: true, index: i))
        }
        hideScoreCells()
    }
    
    func hideScoreCells(){
        var i = 0
        for _ in playerScores{
                if(i<currentPlayerAmount){
                    scoreCellsUI[i].isHidden = false
                }
                else{
                    scoreCellsUI[i].isHidden = true
                }
                i+=1
            }
    }
    
    func pushScoreName(index: Int, text: String){
        playerScores[index].name = text
        print(text)
    }
    
    func updateScoreName(){
        var i = 0
        for textField in scoreCellName{
            textField.text = playerScores[i].name
            i+=1
        }
    }
    
    func updateScoreCellScore(){
        var i = 0
        for cellScore in scoreCellScore{
            cellScore.text = String(playerScores[i].score)
            i+=1
        }
    }
    
    @IBAction func addPlayerPress(_ sender: Any) {
        if currentPlayerAmount<4 {
            currentPlayerAmount+=1
            addPlayer.isEnabled=true
            hideScoreCells()
        }
        else if currentPlayerAmount==4{
            currentPlayerAmount+=1
            addPlayer.isEnabled=false
            hideScoreCells()
        }
        else{
            addPlayer.isEnabled=false
        }
        
    }

    @IBAction func subtract(_ sender: UIButton) {
        
        (playerScores[(sender.tag)/2].score) -= 1
        updateScoreCellScore()
        
    }
    
    @IBAction func add(_ sender: UIButton) {
        
        playerScores[((sender.tag)-1)/2].score += 1
        updateScoreCellScore()
        
    }
    
    @IBAction func removePlayerAction(_ sender: UIButton) {
        
        playerScores.remove(at: sender.tag)
        
        playerScores.append(playerScoreCell(name: "", score: 0, hidden: true, index: sender.tag))
        scoreCellName[playerScores.count-1].delegate = self
        currentPlayerAmount-=1
        hideScoreCells()
        updateScoreCellScore()
        updateScoreName()
        
    }
    
    @IBAction func backToOtherScreens(_ sender: Any) {
            performSegue(withIdentifier: String(backsegueIdentifier), sender: self)
        }
    
}
    

