//
//  InfoView.swift
//  PlayOutlet
//
//  Created by BigOof on 12/31/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import UIKit

class InfoView: UIView {

    @IBOutlet weak var InfoScreen: UIView!
    
    func toggleInfoScreenView(state: Bool){
        InfoScreen.isHidden = state
    }

}
