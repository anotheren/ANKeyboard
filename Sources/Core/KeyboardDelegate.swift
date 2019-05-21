//
//  KeyboardDelegate.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2018/12/19.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import Foundation

public protocol KeyboardDelegate: class {
    
    func keyboard(_ keyboard: Keyboard, didEnter key: String)
    func keyboardDidTapBackspace(_ keyboard: Keyboard)
    func keyboardDidTapPaste(_ keyboard: Keyboard)
}

public extension KeyboardDelegate {
    
    func keyboard(_ keyboard: Keyboard, didEnter key: String) { }
    func keyboardDidTapBackspace(_ keyboard: Keyboard) { }
    func keyboardDidTapPaste(_ keyboard: Keyboard) { }
}
