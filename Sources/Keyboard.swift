//
//  Keyboard.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2018/12/14.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import UIKit
import SnapKit

public class Keyboard: UIView {
    
    let type: KeyboardType
    
    public init(type: KeyboardType) {
        self.type = type
        switch type {
        case .identityNumber:
            let width = UIScreen.main.bounds.width
            let frame = CGRect(origin: .zero, size: CGSize(width: width, height: 215))
            super.init(frame: frame)
            let keyboardView = IdentityNumberKeyboard(frame: frame)
            addSubview(keyboardView)
            keyboardView.snp.makeConstraints { maker in
                maker.edges.equalTo(snp.edges)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor.backgroundColor
    }
}
