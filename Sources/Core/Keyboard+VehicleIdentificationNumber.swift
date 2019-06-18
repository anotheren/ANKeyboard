//
//  Keyboard+VehicleIdentificationNumber.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2019/5/21.
//  Copyright © 2019 anotheren.com. All rights reserved.
//

import UIKit

private let vehicleIdentificationNumberMaxLength = 17

extension Keyboard: VehicleIdentificationNumberKeyboardDelegate {
    
    func keyboard(_ keyboard: VehicleIdentificationNumberKeyboard, didEnter key: String) {
        switch input {
        case let input as UITextField:
            if let text = input.text, text.count < vehicleIdentificationNumberMaxLength {
                input.insertText(key)
            }
        case let input as UITextView:
            if let text = input.text, text.count < vehicleIdentificationNumberMaxLength {
                input.insertText(key)
            }
        default:
            delegate?.keyboard(self, didEnter: key)
        }
    }
    
    func keyboardDidTapBackspace(_ keyboard: VehicleIdentificationNumberKeyboard) {
        switch input {
        case let input as UITextField:
            if let text = input.text, !text.isEmpty {
                input.deleteBackward()
            }
        case let input as UITextView:
            if let text = input.text, !text.isEmpty {
                input.deleteBackward()
            }
        default:
            delegate?.keyboardDidTapBackspace(self)
        }
    }
    
    func keyboardDidTapPaste(_ keyboard: VehicleIdentificationNumberKeyboard) {
        switch input {
        case let input as UITextField:
            if let text = UIPasteboard.general.string {
                input.text = String(text.prefix(vehicleIdentificationNumberMaxLength))
            }
        case let input as UITextView:
            if let text = UIPasteboard.general.string {
                input.text = String(text.prefix(vehicleIdentificationNumberMaxLength))
            }
        default:
            delegate?.keyboardDidTapPaste(self)
        }
    }
    
    func keyboardDidTapReturn(_ keyboard: VehicleIdentificationNumberKeyboard) {
        switch input {
        case let input as UITextField:
            if input.delegate?.textFieldShouldReturn?(input) ?? true {
                input.sendActions(for: .editingDidEndOnExit)
                input.resignFirstResponder()
            }
        case let input as UITextView:
            input.delegate?.textViewDidEndEditing?(input)
            input.resignFirstResponder()
        default:
            delegate?.keyboardDidTapReturn(self)
        }
    }
}
