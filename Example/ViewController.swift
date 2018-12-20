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
        keyboard.delegate = self
        identityNumberTextField.inputView = keyboard
    }
}

extension ViewController: KeyboardDelegate {
    
    func keyboard(_ keyboard: Keyboard, didEnter key: String) {
        identityNumberTextField.text?.append(key)
    }
    
    func keyboardDidTapBackspace(_ keyboard: Keyboard) {
        if let text = identityNumberTextField.text {
            if text.count > 1 {
                identityNumberTextField.text = String(text[..<text.index(text.endIndex, offsetBy: -1)])
            } else {
                identityNumberTextField.text = ""
            }
        }
    }
}
