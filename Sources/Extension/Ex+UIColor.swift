//
//  Ex+UIColor.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2018/12/14.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hex: Int, alpha: CGFloat = 1) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255
        let g = CGFloat((hex & 0xFF00) >> 8) / 255
        let b = CGFloat((hex & 0xFF)) / 255
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    static let normalTextColor = UIColor(hex: 0x39362C)
    static let disableTextColor = UIColor(hex: 0xCECECE)
    
    static let normalKeyColor = UIColor(hex: 0xFEFFFF)
    static let disableKeyColor = UIColor(hex: 0xF9F9F9)
    static let highlightedKeyColor = UIColor(hex: 0xB6C2D0)
    
    static let backgroundColor = UIColor(hex: 0xEAEAEA)
    static let shadowColor = UIColor(hex: 0x848688)
}
