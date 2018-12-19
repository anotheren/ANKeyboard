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
    func keyboardDidDelete(_ keyboard: Keyboard)
}

extension KeyboardDelegate {
    
    public func keyboard(_ keyboard: Keyboard, didEnter key: String) {
        
    }
    
    public func keyboardDidDelete(_ keyboard: Keyboard) {
        
    }
}
