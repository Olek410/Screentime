//
//  AdvancedGameDetalViewController.swift
//  ScreenTime
//
//  Created by BigOof on 11/11/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import UIKit
import WebKit

class GameDetalViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    @IBOutlet var video: WKWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sets webview url to game object video variable
        video.load(URLRequest(url: URL(string: overallCurrentGame.video)!))
        
        testLabel.text = overallCurrentGame.title
    }

        
    
    
}
    

