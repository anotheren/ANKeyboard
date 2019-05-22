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
    
    /// 键盘类型
    public let type: KeyboardType
    /// 内置键盘
    private let _keyboard: BaseKeyboard
    /// 键盘代理，并手动控制输入
    public weak var delegate: KeyboardDelegate?
    /// 当前绑定的输入源
    public private(set) weak var input: UITextInput?
    
    public var textField: UITextField? {
        return input as? UITextField
    }
    
    public var textView: UITextView? {
        return input as? UITextView
    }
    
    public override var tintColor: UIColor! {
        didSet {
            guard tintColor != oldValue else { return }
            _keyboard.tintColor = tintColor
        }
    }
    
    public init(type: KeyboardType) {
        self.type = type
        let width = UIScreen.main.bounds.width
        switch type {
        case .identityCardNumber:
            let height: CGFloat = 216 + Adaptor.modernPhone(44+31, 0)
            let frame = CGRect(origin: .zero, size: CGSize(width: width, height: height))
            let keyboard = IdentityCardNumberKeyboard(frame: frame)
            _keyboard = keyboard
            super.init(frame: frame)
            keyboard.delegate = self
            keyboard.tintColor = tintColor
            add(keyboardView: keyboard)
        case .vehicleIdentificationNumber:
            let height: CGFloat = Adaptor.phoneWidth(246, 278, 294) + Adaptor.modernPhone(34, 0)
            let frame = CGRect(origin: .zero, size: CGSize(width: width, height: height))
            let keyboard = VehicleIdentificationNumberKeyboard(frame: frame)
            _keyboard = keyboard
            super.init(frame: frame)
            keyboard.tintColor = tintColor
            keyboard.delegate = self
            add(keyboardView: keyboard)
        }
    }
    
    private func add(keyboardView: UIView) {
        addSubview(keyboardView)
        keyboardView.snp.makeConstraints { maker in
            maker.edges.equalTo(snp.edges)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor.backgroundColor
    }
    
    /// 绑定一个输入源
    public func bind(to input: UITextInput) {
        self.input = input
        switch input {
        case let input as UITextField:
            input.inputView = self
        case let input as UITextView:
            input.inputView = self
        default:
            break
        }
    }
    
    /// 移除所有绑定的输入源
    public func removeAllTextInput() {
        input = nil
    }
}
