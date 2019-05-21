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
    /// 键盘代理，并手动控制输入
    public weak var delegate: KeyboardDelegate?
    /// 当前绑定类型
    public private(set) var bindType: BindType = .none
    /// 当前绑定的 UITextField
    public private(set) weak var textField: UITextField?
    /// 当前绑定的 UITextView
    public private(set) weak var textView: UITextView?
    
    public init(type: KeyboardType) {
        self.type = type
        let width = UIScreen.main.bounds.width
        switch type {
        case .identityCardNumber:
            let height: CGFloat = 216 + (DeviceHelper.isModernPhone ? 44+31 : 0)
            let frame = CGRect(origin: .zero, size: CGSize(width: width, height: height))
            super.init(frame: frame)
            let keyboard = IdentityCardNumberKeyboard(frame: frame)
            keyboard.tintColor = tintColor
            keyboard.delegate = self
            add(keyboardView: keyboard)
        case .vehicleIdentificationNumber:
            let height: CGFloat = Adaptor.phone(246, 278, 294) + (DeviceHelper.isModernPhone ? 34 : 0)
            let frame = CGRect(origin: .zero, size: CGSize(width: width, height: height))
            super.init(frame: frame)
            let keyboard = VehicleIdentificationNumberKeyboard(frame: frame)
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
    
    /// 绑定一个 UITextField，并自动控制输入
    public func bind(to textField: UITextField) {
        bindType = .textFiled
        textField.inputView = self
        self.textField = textField
        self.textView = nil
    }
    
    /// 绑定一个 UITextView，并自动控制输入
    public func bind(to textView: UITextView) {
        bindType = .textView
        textView.inputView = self
        self.textView = textView
        self.textField = nil
    }
    
    /// 移除所有绑定的输入源
    public func removeAllTextInput() {
        bindType = .none
        self.textField = nil
        self.textView = nil
    }
}

extension Keyboard {
    
    public enum BindType {
        case none
        case textFiled
        case textView
    }
}
