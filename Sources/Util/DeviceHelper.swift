//
//  DeviceHelper.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2018/12/19.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import UIKit

struct DeviceHelper {
    
    static var isModernPhone: Bool {
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
