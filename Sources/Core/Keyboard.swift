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
    
    public let type: KeyboardType
    
    public weak var delegate: KeyboardDelegate?
    
    public private(set) var bindType: BindType = .none
    public private(set) weak var textField: UITextField?
    public private(set) weak var textView: UITextView?
    
    public init(type: KeyboardType) {
        self.type = type
        switch type {
        case .identityNumber:
            let width = UIScreen.main.bounds.width
            var margin: CGFloat = 0
            if DeviceHelper.isModernPhone {
                margin += (44+31)
            }
            let frame = CGRect(origin: .zero, size: CGSize(width: width, height: 216+margin))
            super.init(frame: frame)
            let identityNumberKeyboard = IdentityNumberKeyboard(frame: frame)
            identityNumberKeyboard.delegate = self
            add(keyboardView: identityNumberKeyboard)
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
    
    public func bind(to textField: UITextField) {
        bindType = .textFiled
        textField.inputView = self
        self.textField = textField
        self.textView = nil
    }
    
    public func bind(to textView: UITextView) {
        bindType = .textView
        textView.inputView = self
        self.textView = textView
        self.textField = nil
    }
    
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

// MARK: - IdentityNumberKeyboardDelegate

extension Keyboard: IdentityNumberKeyboardDelegate {
    
    func keyboard(_ keyboard: IdentityNumberKeyboard, didEnter key: String) {
        delegate?.keyboard(self, didEnter: key)
        switch bindType {
        case .textFiled:
            textField?.text?.append(key)
        case .textView:
            textView?.text.append(key)
        default:
            break
        }
    }
    
    func keyboardDidTapBackspace(_ keyboard: IdentityNumberKeyboard) {
        delegate?.keyboardDidTapBackspace(self)
        switch bindType {
        case .textFiled:
            if let text = textField?.text, !text.isEmpty {
                textField?.text?.removeLast()
            }
        case .textView:
            if let text = textView?.text, !text.isEmpty {
                textView?.text?.removeLast()
            }
        default:
            break
        }
    }
}
