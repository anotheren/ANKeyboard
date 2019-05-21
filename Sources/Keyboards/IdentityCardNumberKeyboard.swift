//
//  IdentityCardNumberKeyboard.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2018/12/19.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import UIKit
import SnapKit

protocol IdentityCardNumberKeyboardDelegate: class {
    
    func keyboard(_ keyboard: IdentityCardNumberKeyboard, didEnter key: String)
    func keyboardDidTapBackspace(_ keyboard: IdentityCardNumberKeyboard)
}

final class IdentityCardNumberKeyboard: UIView {
    
    private(set) lazy var key_0: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "0"
        view.addTarget(self, action: #selector(numberKeyTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var key_1: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "1"
        view.addTarget(self, action: #selector(numberKeyTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var key_2: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "2"
        view.addTarget(self, action: #selector(numberKeyTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var key_3: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "3"
        view.addTarget(self, action: #selector(numberKeyTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var key_4: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "4"
        view.addTarget(self, action: #selector(numberKeyTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var key_5: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "5"
        view.addTarget(self, action: #selector(numberKeyTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var key_6: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "6"
        view.addTarget(self, action: #selector(numberKeyTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var key_7: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "7"
        view.addTarget(self, action: #selector(numberKeyTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var key_8: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "8"
        view.addTarget(self, action: #selector(numberKeyTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var key_9: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "9"
        view.addTarget(self, action: #selector(numberKeyTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var key_X: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "X"
        view.addTarget(self, action: #selector(numberKeyTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var key_DELETE: BackspaceKey = {
        let view = BackspaceKey(frame: .zero)
        view.addTarget(self, action: #selector(backspaceKeyTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    weak var delegate: IdentityCardNumberKeyboardDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(key_0)
        addSubview(key_1)
        addSubview(key_2)
        addSubview(key_3)
        addSubview(key_4)
        addSubview(key_5)
        addSubview(key_6)
        addSubview(key_7)
        addSubview(key_8)
        addSubview(key_9)
        addSubview(key_X)
        addSubview(key_DELETE)
        
        let keyHeight: CGFloat = 46.5
        let keyMargin: CGFloat = 6
        let keySpacing: CGFloat = 7
        key_1.snp.makeConstraints { maker in
            maker.left.equalTo(snp.left).offset(keyMargin)
            maker.top.equalTo(snp.top).offset(keyMargin)
            maker.height.equalTo(keyHeight)
        }
        key_2.snp.makeConstraints { maker in
            maker.left.equalTo(key_1.snp.right).offset(keyMargin)
            maker.top.equalTo(snp.top).offset(keyMargin)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(key_1.snp.width)
        }
        key_3.snp.makeConstraints { maker in
            maker.left.equalTo(key_2.snp.right).offset(keyMargin)
            maker.top.equalTo(snp.top).offset(keyMargin)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(key_1.snp.width)
            maker.right.equalTo(snp.right).offset(-keyMargin)
        }
        
        key_4.snp.makeConstraints { maker in
            maker.left.equalTo(snp.left).offset(keyMargin)
            maker.top.equalTo(key_1.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(key_1.snp.width)
        }
        key_5.snp.makeConstraints { maker in
            maker.left.equalTo(key_4.snp.right).offset(keyMargin)
            maker.top.equalTo(key_1.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(key_1.snp.width)
        }
        key_6.snp.makeConstraints { maker in
            maker.left.equalTo(key_5.snp.right).offset(keyMargin)
            maker.top.equalTo(key_1.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(key_1.snp.width)
        }
        
        key_7.snp.makeConstraints { maker in
            maker.left.equalTo(snp.left).offset(keyMargin)
            maker.top.equalTo(key_4.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(key_1.snp.width)
        }
        key_8.snp.makeConstraints { maker in
            maker.left.equalTo(key_7.snp.right).offset(keyMargin)
            maker.top.equalTo(key_4.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(key_1.snp.width)
        }
        key_9.snp.makeConstraints { maker in
            maker.left.equalTo(key_8.snp.right).offset(keyMargin)
            maker.top.equalTo(key_4.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(key_1.snp.width)
        }
        
        key_X.snp.makeConstraints { maker in
            maker.left.equalTo(snp.left).offset(keyMargin)
            maker.top.equalTo(key_7.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(key_1.snp.width)
        }
        key_0.snp.makeConstraints { maker in
            maker.left.equalTo(key_X.snp.right).offset(keyMargin)
            maker.top.equalTo(key_7.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(key_1.snp.width)
        }
        key_DELETE.snp.makeConstraints { maker in
            maker.left.equalTo(key_0.snp.right).offset(keyMargin)
            maker.top.equalTo(key_7.snp.bottom).offset(keySpacing)
            maker.height.equalTo(keyHeight)
            maker.width.equalTo(key_1.snp.width)
        }
    }
    
    @objc private func numberKeyTapped(_ sender: NumberKey) {
        guard let key = sender.title else { return }
        SoundHelper.keyboardLetter()
        delegate?.keyboard(self, didEnter: key)
    }
    
    @objc private func backspaceKeyTapped(_ sender: BackspaceKey) {
        SoundHelper.keyboardBackspace()
        delegate?.keyboardDidTapBackspace(self)
    }
}
