//
//  AdvancedGameDetalViewController.swift
//  ScreenTime
//
//  Created by BigOof on 11/11/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import UIKit

class AdvancedGameDetalViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testLabel.text = currentGame.title
    }
    
}
