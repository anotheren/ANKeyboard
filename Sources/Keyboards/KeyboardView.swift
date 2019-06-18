//
//  KeyboardView.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2019/5/22.
//  Copyright © 2019 anotheren.com. All rights reserved.
//

import UIKit

class KeyboardView: UIView {
    
    override var tintColor: UIColor! {
        didSet {
            guard tintColor != oldValue else { return }
            updateAppearance()
        }
    }
    
    func updateAppearance() {
        
    }
}
