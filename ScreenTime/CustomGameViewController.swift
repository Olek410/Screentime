//
//  CustomGameViewController.swift
//  PlayOutlet
//
//  Created by Olivier Balazy on 2/28/20.
//  Copyright © 2020 Olivier Balazy. All rights reserved.
//

import UIKit

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
    
        modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        updateUI()
    }
    
    func updateUI(){
        
        if !newGameBoolean && !varSet{
            titleTextField.text = overallCurrentGame.title
            //Image selection not implemented
            //insertImage.image = UIImage(named: overallCurrentGame.image)
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
                
                basicGames.remove(at: overallCurrentGame.gameIndex)
                
                var breakloop = false
                var i = 23
                
                while !breakloop {
                    if i < basicGames.count{
                        basicGames[i].gameIndex = i
                    }
                    else{
                        breakloop = true
                    }
                    i += 1
                }
                encodeDataBasic()
            case 3:
                advancedGames.remove(at: overallCurrentGame.gameIndex)
                
                var breakloop = false
                var i = 20
                
                while !breakloop {
                    if i < advancedGames.count{
                        advancedGames[i].gameIndex = i
                    }
                    else{
                        breakloop = true
                    }
                    i += 1
                }
                
                
                
                
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
            basicGames.append(Game.init(catagory: "card", title: titleTextField.text ?? "", image: "customGameImage", difficulty: "", playerAmountLow: playerScore, playerAmountHigh: playerScore, materials: materialsTextField.text ?? "", rules: rulesTextView.text, favorite: false, gameIndex: basicGames.count, editable: true))
            encodeDataBasic()
        case 3:
            advancedGames.append(Game.init(catagory: "card", title: titleTextField.text ?? "", image: "customGameImage", difficulty: "", playerAmountLow: playerScore, playerAmountHigh: playerScore, materials: materialsTextField.text ?? "", rules: rulesTextView.text, favorite: false, gameIndex: advancedGames.count, editable: true))
            encodeDataAdvanced()
        default:
            break
            }
        
        }
        else{
            switch backsegueIdentifier {
            case 2:
                basicGames[basicCurrentIndex].title = titleTextField.text ?? ""
                basicGames[basicCurrentIndex].materials = materialsTextField.text ?? ""
                basicGames[basicCurrentIndex].playerAmountLow = Int(playerNumber.text ?? "1") ?? 1
                basicGames[basicCurrentIndex].playerAmountHigh = Int(playerNumber.text ?? "1") ?? 1
                basicGames[basicCurrentIndex].playerAmountString = "\(Int(playerNumber.text ?? "1") ?? 1)"
                basicGames[basicCurrentIndex].rules = rulesTextView.text
                encodeDataBasic()
            case 3:
                advancedGames[advancedCurrentIndex].title = titleTextField.text ?? ""
                advancedGames[advancedCurrentIndex].materials = materialsTextField.text ?? ""
                advancedGames[advancedCurrentIndex].playerAmountLow = Int(playerNumber.text ?? "1") ?? 1
                advancedGames[advancedCurrentIndex].playerAmountHigh = Int(playerNumber.text ?? "1") ?? 1
                advancedGames[advancedCurrentIndex].playerAmountString = "\(Int(playerNumber.text ?? "1") ?? 1)"
                advancedGames[advancedCurrentIndex].rules = rulesTextView.text
                encodeDataAdvanced()
            default:
                break
            }
        }
    }
    
    

}
