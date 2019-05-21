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
        switch bindType {
        case .textFiled:
            if let text = textField?.text, text.count < identityCardNumberMaxLength {
                textField?.insertText(key)
            }
        case .textView:
            if let text = textView?.text, text.count < identityCardNumberMaxLength {
                textView?.insertText(key)
            }
        case .none:
            delegate?.keyboard(self, didEnter: key)
        }
    }
    
    func keyboardDidTapBackspace(_ keyboard: IdentityCardNumberKeyboard) {
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
}
