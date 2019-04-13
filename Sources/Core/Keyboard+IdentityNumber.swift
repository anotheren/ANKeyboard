//
//  Keyboard+IdentityNumber.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2019/4/13.
//  Copyright © 2019 anotheren.com. All rights reserved.
//

import Foundation

fileprivate let identityNumberMaxLength = 18

extension Keyboard: IdentityNumberKeyboardDelegate {
    
    func keyboard(_ keyboard: IdentityNumberKeyboard, didEnter key: String) {
        delegate?.keyboard(self, didEnter: key)
        switch bindType {
        case .textFiled:
            if let text = textField?.text, text.count < identityNumberMaxLength {
                textField?.text?.append(key)
            }
        case .textView:
            if let text = textView?.text, text.count < identityNumberMaxLength {
                textView?.text.append(key)
            }
        default:
            break
        }
    }
    
    func keyboardDidTapBackspace(_ keyboard: IdentityNumberKeyboard) {
        delegate?.keyboardDidTapBackspace(self)
        switch bindType {
        case .textFiled:
            if let text = textField?.text, !text.isEmpty {
                textField?.text?.removeLast()
            }
        case .textView:
            if let text = textView?.text, !text.isEmpty {
                textView?.text?.removeLast()
            }
        default:
            break
        }
    }
}
