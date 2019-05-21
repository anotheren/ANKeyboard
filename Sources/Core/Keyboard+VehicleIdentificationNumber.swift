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
        switch bindType {
        case .textFiled:
            if let text = textField?.text, text.count < vehicleIdentificationNumberMaxLength {
                textField?.insertText(key)
            }
        case .textView:
            if let text = textView?.text, text.count < vehicleIdentificationNumberMaxLength {
                textView?.insertText(key)
            }
        case .none:
            delegate?.keyboard(self, didEnter: key)
        }
    }
    
    func keyboardDidTapBackspace(_ keyboard: VehicleIdentificationNumberKeyboard) {
        switch bindType {
        case .textFiled:
            if let text = textField?.text, !text.isEmpty {
                textField?.deleteBackward()
            }
        case .textView:
            if let text = textView?.text, !text.isEmpty {
                textView?.deleteBackward()
            }
        case .none:
            delegate?.keyboardDidTapBackspace(self)
        }
    }
    
    func keyboardDidTapPaste(_ keyboard: VehicleIdentificationNumberKeyboard) {
        switch bindType {
        case .textFiled:
            if let text = UIPasteboard.general.string {
                textField?.text = text
            }
        case .textView:
            if let text = UIPasteboard.general.string {
                textView?.text = text
            }
        case .none:
            delegate?.keyboardDidTapPaste(self)
        }
    }
    
    func keyboardDidTapReturn(_ keyboard: VehicleIdentificationNumberKeyboard) {
        switch bindType {
        case .textFiled:
            if let textField = textField {
                if textField.delegate?.textFieldShouldReturn?(textField) ?? true {
                    textField.sendActions(for: .editingDidEndOnExit)
                }
            }
        case .textView:
            if let textView = textView {
                textView.delegate?.textViewDidEndEditing?(textView)
            }
        default:
            delegate?.keyboardDidTapReturn(self)
        }
    }
}
