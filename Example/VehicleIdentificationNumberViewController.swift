//
//  VehicleIdentificationNumberViewController.swift
//  Example
//
//  Created by 刘栋 on 2019/5/21.
//  Copyright © 2019 anotheren.com. All rights reserved.
//

import UIKit
import ANKeyboard

class VehicleIdentificationNumberViewController: UIViewController {
    
    @IBOutlet weak var vehicleIdentificationNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehicleIdentificationNumberTextField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        let keyboard = Keyboard(type: .vehicleIdentificationNumber)
        keyboard.bind(to: vehicleIdentificationNumberTextField)
    }
    
    @objc private func editingChanged(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
}
