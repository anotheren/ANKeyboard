//
//  IdentityCardNumberViewController.swift
//  Example
//
//  Created by 刘栋 on 2018/12/19.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import UIKit
import ANKeyboard

class IdentityCardNumberViewController: UIViewController {

    @IBOutlet weak var identityCardNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        identityCardNumberTextField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        let keyboard = Keyboard(type: .identityCardNumber)
        keyboard.bind(to: identityCardNumberTextField)
    }
    
    @objc private func editingChanged(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
}
/*
extension IdentityNumberKeyboardViewController: KeyboardDelegate {
    
    func keyboard(_ keyboard: Keyboard, didEnter key: String) {
        identityNumberTextField.insertText(key)
    }
    
    func keyboardDidTapBackspace(_ keyboard: Keyboard) {
        identityNumberTextField.deleteBackward()
    }
}
*/
