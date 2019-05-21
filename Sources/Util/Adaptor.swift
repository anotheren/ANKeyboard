//
//  Adaptor.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2019/5/21.
//  Copyright © 2019 anotheren.com. All rights reserved.
//

import Foundation

struct Adaptor<T> {
    
    static func phone(_ width320: T, _ width375: T, _ width414: T) -> T {
        switch UIScreen.main.bounds.width {
        case 320:
            return width320
        case 375:
            return width375
        case 414:
            return width414
        default:
            return width375
        }
    }
}
