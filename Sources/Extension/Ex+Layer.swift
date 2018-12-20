//
//  Ex+Layer.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2018/12/20.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import Foundation

extension CALayer {
    
    func applySketchShadow(color: UIColor = .black,
                           alpha: Float = 0.5,
                           x: CGFloat = 0,
                           y: CGFloat = 2,
                           blur: CGFloat = 4,
                           spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
