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
                textField?.sendActions(for: .editingChanged)
            }
        case .textView:
            if let textView = textView, let text = textView.text, text.count < identityNumberMaxLength {
                textView.text.append(key)
                textView.delegate?.textViewDidChange?(textView)
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
                textField?.sendActions(for: .editingChanged)
            }
        case .textView:
            if let textView = textView, let text = textView.text, !text.isEmpty {
                textView.text?.removeLast()
                textView.delegate?.textViewDidChange?(textView)
            }
        default:
            break
        }
    }
}
