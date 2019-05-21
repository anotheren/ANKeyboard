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
    func keyboardDidTapPaste(_ keyboard: VehicleIdentificationNumberKeyboard)
    func keyboardDidTapReturn(_ keyboard: VehicleIdentificationNumberKeyboard)
}

final class VehicleIdentificationNumberKeyboard: UIView {
    
    weak var delegate: VehicleIdentificationNumberKeyboardDelegate?
    
    override var tintColor: UIColor! {
        didSet {
            for view in subviews {
                if view is ReturnKey {
                    view.backgroundColor = tintColor
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .backgroundColor
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
        let line1Titles = "1234567890"
        for (index, title) in line1Titles.enumerated() {
            let key = LetterKey(frame: .zero)
            key.title = String(title)
            key.addTarget(self, action: #selector(letterKeyTapped(_:)), for: .touchUpInside)
            addSubview(key)
            line1Keys.append(key)
            key.snp.makeConstraints { maker in
                maker.top.equalTo(line1.snp.top)
                maker.bottom.equalTo(line1.snp.bottom)
                if index == 0 {
                    maker.left.equalTo(line1.snp.left)
                } else if index == line1Titles.count-1 {
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
            maker.top.equalTo(line1.snp.bottom).offset(horizontalMargin)
            maker.centerX.equalTo(snp.centerX)
            maker.height.equalTo(lineHeight)
        }
        var line2Keys = [LetterKey]()
        let line2Titles = "QWERTYUIOP"
        for (index, title) in line2Titles.enumerated() {
            let key = LetterKey(frame: .zero)
            key.title = String(title)
            switch String(title) {
            case "Q", "I", "O":
                key.isEnabled = false
            default:
                key.addTarget(self, action: #selector(letterKeyTapped(_:)), for: .touchUpInside)
            }
            addSubview(key)
            line2Keys.append(key)
            key.snp.makeConstraints { maker in
                maker.top.equalTo(line2.snp.top)
                maker.bottom.equalTo(line2.snp.bottom)
                if index == 0 {
                    maker.left.equalTo(line2.snp.left)
                    maker.width.equalTo(line1Keys[0].snp.width)
                } else if index == line2Titles.count-1 {
                    maker.left.equalTo(line2Keys[index-1].snp.right).offset(verticalMargin)
                    maker.width.equalTo(line1Keys[0].snp.width)
                    maker.right.equalTo(line2.snp.right)
                } else {
                    maker.left.equalTo(line2Keys[index-1].snp.right).offset(verticalMargin)
                    maker.width.equalTo(line1Keys[0].snp.width)
                }
            }
        }
        
        let line3 = UILayoutGuide()
        addLayoutGuide(line3)
        line3.snp.makeConstraints { maker in
            maker.top.equalTo(line2.snp.bottom).offset(horizontalMargin)
            maker.centerX.equalTo(snp.centerX)
            maker.height.equalTo(lineHeight)
        }
        var line3Keys = [LetterKey]()
        let line3Titles = "ASDFGHJKL"
        for (index, title) in line3Titles.enumerated() {
            let key = LetterKey(frame: .zero)
            key.title = String(title)
            key.addTarget(self, action: #selector(letterKeyTapped(_:)), for: .touchUpInside)
            addSubview(key)
            line3Keys.append(key)
            key.snp.makeConstraints { maker in
                maker.top.equalTo(line3.snp.top)
                maker.bottom.equalTo(line3.snp.bottom)
                if index == 0 {
                    maker.left.equalTo(line3.snp.left)
                    maker.width.equalTo(line1Keys[0].snp.width)
                } else if index == line3Titles.count-1 {
                    maker.left.equalTo(line3Keys[index-1].snp.right).offset(verticalMargin)
                    maker.width.equalTo(line1Keys[0].snp.width)
                    maker.right.equalTo(line3.snp.right)
                } else {
                    maker.left.equalTo(line3Keys[index-1].snp.right).offset(verticalMargin)
                    maker.width.equalTo(line1Keys[0].snp.width)
                }
            }
        }
        
        let line4 = UILayoutGuide()
        addLayoutGuide(line4)
        line4.snp.makeConstraints { maker in
            maker.top.equalTo(line3.snp.bottom).offset(horizontalMargin)
            maker.centerX.equalTo(snp.centerX)
            maker.height.equalTo(lineHeight)
        }
        var line4Keys = [LetterKey]()
        let line4Titles = "ZXCVBNM"
        for (index, title) in line4Titles.enumerated() {
            let key = LetterKey(frame: .zero)
            key.title = String(title)
            key.addTarget(self, action: #selector(letterKeyTapped(_:)), for: .touchUpInside)
            addSubview(key)
            line4Keys.append(key)
            key.snp.makeConstraints { maker in
                maker.top.equalTo(line4.snp.top)
                maker.bottom.equalTo(line4.snp.bottom)
                if index == 0 {
                    maker.left.equalTo(line4.snp.left)
                    maker.width.equalTo(line1Keys[0].snp.width)
                } else if index == line4Titles.count-1 {
                    maker.left.equalTo(line4Keys[index-1].snp.right).offset(verticalMargin)
                    maker.width.equalTo(line1Keys[0].snp.width)
                    maker.right.equalTo(line4.snp.right)
                } else {
                    maker.left.equalTo(line4Keys[index-1].snp.right).offset(verticalMargin)
                    maker.width.equalTo(line1Keys[0].snp.width)
                }
            }
        }
        
        let pasteKey = FunctionKey(frame: .zero)
        pasteKey.title = "粘贴"
        pasteKey.addTarget(self, action: #selector(pasteKeyTapped(_:)), for: .touchUpInside)
        addSubview(pasteKey)
        pasteKey.snp.makeConstraints { maker in
            maker.left.equalTo(snp.left).offset(leftRightMargin)
            maker.right.equalTo(line4.snp.left).offset(-verticalMargin)
            maker.top.equalTo(line4.snp.top)
            maker.bottom.equalTo(line4.snp.bottom)
        }
        
        let deleteKey = FunctionKey(frame: .zero)
        deleteKey.title = "删除"
        deleteKey.addTarget(self, action: #selector(deleteKeyTapped(_:)), for: .touchUpInside)
        addSubview(deleteKey)
        deleteKey.snp.makeConstraints { maker in
            maker.left.equalTo(line4.snp.right).offset(verticalMargin)
            maker.right.equalTo(snp.right).offset(-leftRightMargin)
            maker.top.equalTo(line4.snp.top)
            maker.bottom.equalTo(line4.snp.bottom)
        }
        
        let returnKey = ReturnKey(type: .custom)
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = UIFont.systemFont(ofSize: 16, weight: .regular)
        attributes[.foregroundColor] = UIColor.white
        let title = NSAttributedString(string: "完成", attributes: attributes)
        returnKey.setAttributedTitle(title, for: .normal)
        returnKey.layer.cornerRadius = 4
        returnKey.layer.masksToBounds = true
        returnKey.addTarget(self, action: #selector(returnKeyTapped(_:)), for: .touchUpInside)
        returnKey.tintColor = tintColor
        addSubview(returnKey)
        returnKey.snp.makeConstraints { maker in
            maker.top.equalTo(line4.snp.bottom).offset(horizontalMargin)
            maker.left.equalTo(pasteKey.snp.left)
            maker.right.equalTo(deleteKey.snp.right)
            maker.height.equalTo(48)
        }
    }
    
    @objc private func letterKeyTapped(_ sender: LetterKey) {
        guard let key = sender.title else { return }
        SoundHelper.keyboardLetter()
        delegate?.keyboard(self, didEnter: key)
    }
    
    @objc private func pasteKeyTapped(_ sender: FunctionKey) {
        SoundHelper.keyboardOther()
        delegate?.keyboardDidTapPaste(self)
    }
    
    @objc private func deleteKeyTapped(_ sender: FunctionKey) {
        SoundHelper.keyboardBackspace()
        delegate?.keyboardDidTapBackspace(self)
    }
    
    @objc private func returnKeyTapped(_ sender: UIButton) {
        SoundHelper.keyboardOther()
        delegate?.keyboardDidTapReturn(self)
    }
}
