//
//  SoundHelper.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2018/12/20.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import AudioToolbox

struct SoundHelper {
    
//    1123——键盘字母按钮按下声音
//    1155——退格键声音
//    1156——其他键盘功能键声音
//    1519——6s peek 震动效果
//    1520——6s pop 震动效果
//    1521——6s 三连震 震动效果
    
    static func keyboardLetter() {
        AudioServicesPlaySystemSound(1123)
    }
    
    static func keyboardBackspace() {
        AudioServicesPlaySystemSound(1155)
    }
    
    static func keyboardOther() {
        AudioServicesPlaySystemSound(1156)
    }
}
