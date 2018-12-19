//
//  IdentityNumberKeyboard.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2018/12/19.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import UIKit
import SnapKit

protocol IdentityNumberKeyboardDelegate: class {
    
    func keyboard(_ keyboard: IdentityNumberKeyboard, didEnter key: String)
    func keyboardDidDelete(_ keyboard: IdentityNumberKeyboard)
}

final class IdentityNumberKeyboard: UIView {
    
    private(set) lazy var zeroButton: KeyItemButton = {
        let view = KeyItemButton(frame: .zero)
        view.title = "0"
        view.tag = 0
        return view
    }()
    
    private(set) lazy var oneButton: KeyItemButton = {
        let view = KeyItemButton(frame: .zero)
        view.title = "1"
        view.tag = 1
        return view
    }()
    
    private(set) lazy var twoButton: KeyItemButton = {
        let view = KeyItemButton(frame: .zero)
        view.title = "2"
        view.tag = 2
        return view
    }()
    
    private(set) lazy var threeButton: KeyItemButton = {
        let view = KeyItemButton(frame: .zero)
        view.title = "3"
        view.tag = 3
        return view
    }()
    
    private(set) lazy var fourButton: KeyItemButton = {
        let view = KeyItemButton(frame: .zero)
        view.title = "4"
        view.tag = 4
        return view
    }()
    
    private(set) lazy var fiveButton: KeyItemButton = {
        let view = KeyItemButton(frame: .zero)
        view.title = "5"
        view.tag = 5
        return view
    }()
    
    private(set) lazy var sixButton: KeyItemButton = {
        let view = KeyItemButton(frame: .zero)
        view.title = "6"
        view.tag = 6
        return view
    }()
    
    private(set) lazy var sevenButton: KeyItemButton = {
        let view = KeyItemButton(frame: .zero)
        view.title = "7"
        view.tag = 7
        return view
    }()
    
    private(set) lazy var eightButton: KeyItemButton = {
        let view = KeyItemButton(frame: .zero)
        view.title = "8"
        view.tag = 8
        return view
    }()
    
    private(set) lazy var nineButton: KeyItemButton = {
        let view = KeyItemButton(frame: .zero)
        view.title = "9"
        view.tag = 9
        return view
    }()
    
    private(set) lazy var xButton: KeyItemButton = {
        let view = KeyItemButton(frame: .zero)
        view.title = "X"
        view.tag = 10
        return view
    }()
    
    private(set) lazy var deleteButton: KeyItemButton = {
        let view = KeyItemButton(frame: .zero)
        view.title = "X"
        view.tag = 10
        return view
    }()
    
    weak var delegate: IdentityNumberKeyboardDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(zeroButton)
        addSubview(oneButton)
        addSubview(twoButton)
        addSubview(threeButton)
        addSubview(fourButton)
        addSubview(fiveButton)
        addSubview(sixButton)
        addSubview(sevenButton)
        addSubview(eightButton)
        addSubview(nineButton)
        addSubview(xButton)
        addSubview(deleteButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let keyHeight: CGFloat = 46
        let keyMargin: CGFloat = 6
        let keySpacing: CGFloat = 7
        oneButton.snp.makeConstraints { maker in
            maker.left.equalTo(snp.left).offset(keyMargin)
            maker.top.equalTo(snp.top).offset(keyMargin)
            maker.height.equalTo(keyHeight)
        }
        twoButton.snp.makeConstraints { maker in
            maker.left.equalTo(oneButton.snp.right).offset(keyMargin)
            maker.top.equalTo(snp.top).offset(keyMargin)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(oneButton.snp.width)
        }
        threeButton.snp.makeConstraints { maker in
            maker.left.equalTo(twoButton.snp.right).offset(keyMargin)
            maker.top.equalTo(snp.top).offset(keyMargin)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(oneButton.snp.width)
            maker.right.equalTo(snp.right).offset(-keyMargin)
        }
        
        fourButton.snp.makeConstraints { maker in
            maker.left.equalTo(snp.left).offset(keyMargin)
            maker.top.equalTo(oneButton.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(oneButton.snp.width)
        }
        fiveButton.snp.makeConstraints { maker in
            maker.left.equalTo(fourButton.snp.right).offset(keyMargin)
            maker.top.equalTo(oneButton.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(oneButton.snp.width)
        }
        sixButton.snp.makeConstraints { maker in
            maker.left.equalTo(fiveButton.snp.right).offset(keyMargin)
            maker.top.equalTo(oneButton.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(oneButton.snp.width)
        }
        
        sevenButton.snp.makeConstraints { maker in
            maker.left.equalTo(snp.left).offset(keyMargin)
            maker.top.equalTo(fourButton.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(oneButton.snp.width)
        }
        eightButton.snp.makeConstraints { maker in
            maker.left.equalTo(sevenButton.snp.right).offset(keyMargin)
            maker.top.equalTo(fourButton.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(oneButton.snp.width)
        }
        nineButton.snp.makeConstraints { maker in
            maker.left.equalTo(eightButton.snp.right).offset(keyMargin)
            maker.top.equalTo(fourButton.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(oneButton.snp.width)
        }
        
        xButton.snp.makeConstraints { maker in
            maker.left.equalTo(snp.left).offset(keyMargin)
            maker.top.equalTo(sevenButton.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(oneButton.snp.width)
        }
        zeroButton.snp.makeConstraints { maker in
            maker.left.equalTo(xButton.snp.right).offset(keyMargin)
            maker.top.equalTo(sevenButton.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(oneButton.snp.width)
        }
        deleteButton.snp.makeConstraints { maker in
            maker.left.equalTo(zeroButton.snp.right).offset(keyMargin)
            maker.top.equalTo(sevenButton.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(oneButton.snp.width)
        }
    }
}
