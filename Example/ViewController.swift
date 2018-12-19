//
//  ViewController.swift
//  Example
//
//  Created by 刘栋 on 2018/12/19.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import UIKit
import ANKeyboard

class ViewController: UIViewController {

    @IBOutlet weak var identityNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let keyboard = Keyboard(type: .identityNumber)
        
        identityNumberTextField.inputView = keyboard
        
    }
}

