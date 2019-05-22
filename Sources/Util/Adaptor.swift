//
//  Adaptor.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2019/5/21.
//  Copyright © 2019 anotheren.com. All rights reserved.
//

import Foundation

struct Adaptor<T> {
    
    static func phoneWidth(_ width320: T, _ width375: T, _ width414: T) -> T {
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
    
    static func modernPhone(_ modern: T, _ traditional: T)-> T {
        return isModernPhone ? modern : traditional
    }
    
    private static var isModernPhone: Bool {
        let size = UIScreen.main.bounds.size
        switch size {
        case CGSize(width: 375, height: 812), CGSize(width: 812, height: 375): // iPhone X, iPhone Xs
            return true
        case CGSize(width: 414, height: 896), CGSize(width: 414, height: 896): // iPhone Xs Max, iPhone Xr
            return true
        default:
            return false
        }
    }
}
