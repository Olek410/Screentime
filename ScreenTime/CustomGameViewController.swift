//
//  CustomGameViewController.swift
//  PlayOutlet
//
//  Created by Olivier Balazy on 2/28/20.
//  Copyright © 2020 Olivier Balazy. All rights reserved.
//

import UIKit

class CustomGameViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var insertImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        modalPresentationStyle = UIModalPresentationStyle.fullScreen

    }
    
    @IBAction func backToOtherScreensCustom(_ sender: Any) {
        performSegue(withIdentifier: String(backsegueIdentifier), sender: self)
    }

}
