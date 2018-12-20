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
    func keyboardDidTapBackspace(_ keyboard: IdentityNumberKeyboard)
}

final class IdentityNumberKeyboard: UIView {
    
    private(set) lazy var zeroButton: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "0"
        view.tag = 0
        view.addTarget(self, action: #selector(itemButtonTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var oneButton: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "1"
        view.tag = 1
        view.addTarget(self, action: #selector(itemButtonTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var twoButton: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "2"
        view.tag = 2
        view.addTarget(self, action: #selector(itemButtonTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var threeButton: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "3"
        view.tag = 3
        view.addTarget(self, action: #selector(itemButtonTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var fourButton: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "4"
        view.tag = 4
        view.addTarget(self, action: #selector(itemButtonTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var fiveButton: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "5"
        view.tag = 5
        view.addTarget(self, action: #selector(itemButtonTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var sixButton: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "6"
        view.tag = 6
        view.addTarget(self, action: #selector(itemButtonTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var sevenButton: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "7"
        view.tag = 7
        view.addTarget(self, action: #selector(itemButtonTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var eightButton: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "8"
        view.tag = 8
        view.addTarget(self, action: #selector(itemButtonTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var nineButton: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "9"
        view.tag = 9
        view.addTarget(self, action: #selector(itemButtonTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var xButton: NumberKey = {
        let view = NumberKey(frame: .zero)
        view.title = "X"
        view.tag = 10
        view.addTarget(self, action: #selector(itemButtonTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var deleteButton: BackspaceKey = {
        let view = BackspaceKey(frame: .zero)
        view.addTarget(self, action: #selector(backspaceKeyTapped(_:)), for: .touchUpInside)
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
        let keyHeight: CGFloat = 46.5
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
    
    @objc private func itemButtonTapped(_ sender: NumberKey) {
        SoundHelper.keyboardLetter()
        if sender.tag < 10 {
            delegate?.keyboard(self, didEnter: sender.tag.description)
        } else {
            delegate?.keyboard(self, didEnter: "X")
        }
    }
    
    @objc private func backspaceKeyTapped(_ sender: BackspaceKey) {
        SoundHelper.keyboardBackspace()
        delegate?.keyboardDidTapBackspace(self)
    }
}
