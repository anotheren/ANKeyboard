//
//  Keyboard+IdentityCardNumber.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2019/4/13.
//  Copyright © 2019 anotheren.com. All rights reserved.
//

import UIKit

private let identityCardNumberMaxLength = 18

extension Keyboard: IdentityCardNumberKeyboardDelegate {
    
    func keyboard(_ keyboard: IdentityCardNumberKeyboard, didEnter key: String) {
        switch input {
        case let input as UITextField:
            if let text = input.text, text.count < identityCardNumberMaxLength {
                input.insertText(key)
            }
        case let input as UITextView:
            if let text = input.text, text.count < identityCardNumberMaxLength {
                input.insertText(key)
            }
        default:
            delegate?.keyboard(self, didEnter: key)
        }
    }
    
    func keyboardDidTapBackspace(_ keyboard: IdentityCardNumberKeyboard) {
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
}
