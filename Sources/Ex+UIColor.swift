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
    
    static let normalColor = UIColor(hex: 0xFEFFFF)
    static let highlightedColor = UIColor(hex: 0xB6C2D0)
    static let backgroundColor = UIColor(hex: 0xD1D3DA)
}
