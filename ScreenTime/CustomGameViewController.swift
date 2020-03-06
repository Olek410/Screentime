//
//  CustomGameViewController.swift
//  PlayOutlet
//
//  Created by Olivier Balazy on 2/28/20.
//  Copyright © 2020 Olivier Balazy. All rights reserved.
//

import UIKit

var customBasicGameIndex = 0
var customAdvancedGameIndex = 0

var newGameBoolean = false

var varSet = false

class CustomGameViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var insertImage: UIImageView!
    @IBOutlet weak var materialsTextField: UITextField!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var playerNumber: UILabel!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var rulesTextView: UITextView!
    
    var playerScore = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        varSet = false
        
        customBasicGameIndex = basicGames.count
        customAdvancedGameIndex = basicGames.count
        
        print("qw", customBasicGameIndex)

        modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        updateUI()
    }
    
    func updateUI(){
        
        if !newGameBoolean && !varSet{
            titleTextField.text = overallCurrentGame.title
            insertImage.image = UIImage(named: overallCurrentGame.image)
            materialsTextField.text = overallCurrentGame.materials
            playerScore = overallCurrentGame.playerAmountLow
            rulesTextView.text = overallCurrentGame.rules
            
            varSet = true
        }
        
        playerNumber.text = String(playerScore)
        if playerScore<=1 {
            minus.isEnabled = false
        }
        else{
            minus.isEnabled = true
        }
        
        if playerScore>=9 {
            plus.isEnabled = false
        }
        else{
            plus.isEnabled = true
        }

    }
    
    @IBAction func backToOtherScreensCustom(_ sender: Any) {
        performSegue(withIdentifier: String(backsegueIdentifier), sender: self)
    }
    @IBAction func minus(_ sender: Any) {
        playerScore -= 1
        updateUI()
    }
    @IBAction func plus(_ sender: Any) {
        playerScore += 1
        updateUI()
    }
    
    @IBAction func deleteFields(_ sender: Any) {
        if !newGameBoolean{
            switch backsegueIdentifier{
            case 2:
                
                print("qwdelete", overallCurrentGame.gameIndex)
                
                basicGames.remove(at: overallCurrentGame.gameIndex)
                
                var breakloop = false
                var i = 23
                
                while !breakloop {
                    if i < basicGames.count-1{
                        basicGames[i] = basicGames[i+1]
                        basicGames[i].gameIndex = i
                    }
                    else{
                        breakloop = true
                    }
                    i += 1
                }
                
                customBasicGameIndex -= 1
                basicCurrentIndex = customBasicGameIndex
                encodeDataBasic()
            case 3:
                advancedGames.remove(at: customAdvancedGameIndex)
                
                
                
                
                
                
                
                customAdvancedGameIndex -= 1
                encodeDataAdvanced()
            default:
                break
            }
        }
        
    }
    
    @IBAction func addGame(_ sender: Any) {
        if newGameBoolean {
        switch backsegueIdentifier {
        case 2:
            basicGames.append(Game.init(catagory: "card", title: titleTextField.text ?? "", image: "insertImageIcon.001", difficulty: "", playerAmountLow: playerScore, playerAmountHigh: playerScore, materials: materialsTextField.text ?? "", rules: rulesTextView.text, favorite: false, gameIndex: customBasicGameIndex, editable: true))
            customBasicGameIndex += 1
            encodeDataBasic()
        case 3:
            advancedGames.append(Game.init(catagory: "card", title: titleTextField.text ?? "", image: "insertImageIcon.001", difficulty: "", playerAmountLow: playerScore, playerAmountHigh: playerScore, materials: materialsTextField.text ?? "", rules: rulesTextView.text, favorite: false, gameIndex: customAdvancedGameIndex, editable: true))
            customAdvancedGameIndex += 1
            encodeDataAdvanced()
        default:
            break
            }
        
        }
        else{
            
            overallCurrentGame.title = titleTextField.text ?? ""
            //overallCurrentGame.image = insertImage
            overallCurrentGame.materials = materialsTextField.text ?? ""
            overallCurrentGame.playerAmountLow = playerScore
            overallCurrentGame.rules = rulesTextView.text
            encodeDataBasic()
            encodeDataAdvanced()
            
        }
    }
    
    

}
