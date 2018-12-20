//
//  SoundHelper.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2018/12/20.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import AudioToolbox

struct SoundHelper {
    
    static func keyboardTink() {
        AudioServicesPlaySystemSound(1103)
    }
    
    static func keyboardTockLow() {
        AudioServicesPlaySystemSound(1104)
    }
    
    static func keyboardTockHigh() {
        AudioServicesPlaySystemSound(1105)
    }
}
