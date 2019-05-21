//
//  VehicleIdentificationNumberKeyboard.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2019/5/21.
//  Copyright © 2019 anotheren.com. All rights reserved.
//

import UIKit
import SnapKit

protocol VehicleIdentificationNumberKeyboardDelegate: class {
    
    func keyboard(_ keyboard: VehicleIdentificationNumberKeyboard, didEnter key: String)
    func keyboardDidTapBackspace(_ keyboard: VehicleIdentificationNumberKeyboard)
}

final class VehicleIdentificationNumberKeyboard: UIView {
    
    weak var delegate: VehicleIdentificationNumberKeyboardDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let topMargin = 10
        let leftRightMargin = 4
        let horizontalMargin = 10
        let verticalMargin = 5
        let lineHeight = Adaptor.phone(36, 44, 48)
        
        let line1 = UILayoutGuide()
        addLayoutGuide(line1)
        line1.snp.makeConstraints { maker in
            maker.top.equalTo(snp.top).offset(topMargin)
            maker.left.equalTo(snp.left).offset(leftRightMargin)
            maker.right.equalTo(snp.right).offset(-leftRightMargin)
            maker.height.equalTo(lineHeight)
        }
        var line1Keys = [LetterKey]()
        for (index, title) in "0123456789".enumerated() {
            let key = LetterKey(frame: .zero)
            key.title = String(title)
            key.addTarget(self, action: #selector(itemButtonTapped(_:)), for: .touchUpInside)
            addSubview(key)
            line1Keys.append(key)
            key.snp.makeConstraints { maker in
                maker.top.equalTo(line1.snp.top)
                maker.bottom.equalTo(line1.snp.bottom)
                if index == 0 {
                    maker.left.equalTo(line1.snp.left)
                } else if index == 9 {
                    maker.left.equalTo(line1Keys[index-1].snp.right).offset(verticalMargin)
                    maker.width.equalTo(line1Keys[0].snp.width)
                    maker.right.equalTo(line1.snp.right)
                } else {
                    maker.left.equalTo(line1Keys[index-1].snp.right).offset(verticalMargin)
                    maker.width.equalTo(line1Keys[0].snp.width)
                }
            }
        }
        
        let line2 = UILayoutGuide()
        addLayoutGuide(line2)
        line2.snp.makeConstraints { maker in
            maker.top.equalTo(line1.snp.bottom)
            maker.centerX.equalTo(snp.centerX)
            maker.height.equalTo(lineHeight)
        }
        var line2Keys = [LetterKey]()
        for (index, title) in "QWERTYUIOP".enumerated() {
            let key = LetterKey(frame: .zero)
            key.title = String(title)
            switch String(title) {
            case "Q", "I", "O":
                key.isEnabled = false
            default:
                key.addTarget(self, action: #selector(itemButtonTapped(_:)), for: .touchUpInside)
            }
            addSubview(key)
            line2Keys.append(key)
            key.snp.makeConstraints { maker in
                maker.top.equalTo(line2.snp.top)
                maker.bottom.equalTo(line2.snp.bottom)
                if index == 0 {
                    maker.left.equalTo(line2.snp.left)
                    maker.width.equalTo(line1Keys[0].snp.width)
                } else if index == 9 {
                    maker.left.equalTo(line2Keys[index-1].snp.right).offset(verticalMargin)
                    maker.width.equalTo(line1Keys[0].snp.width)
                    maker.right.equalTo(line2.snp.right)
                } else {
                    maker.left.equalTo(line2Keys[index-1].snp.right).offset(verticalMargin)
                    maker.width.equalTo(line1Keys[0].snp.width)
                }
            }
        }
        
        
    }
    
    
    @objc private func itemButtonTapped(_ sender: LetterKey) {
        guard let key = sender.title else { return }
        SoundHelper.keyboardLetter()
        delegate?.keyboard(self, didEnter: key)
    }
}
