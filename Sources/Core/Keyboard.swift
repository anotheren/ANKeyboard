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
    
    public private(set) weak var textField: UITextField?
    
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
            let keyboardView = IdentityNumberKeyboard(frame: frame)
            keyboardView.delegate = self
            addKeyboardView(keyboardView)
        }
    }
    
    private func addKeyboardView(_ keyboardView: UIView) {
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
    
    public func add(textField: UITextField) {
        self.textField = textField
    }
}

// MARK: - IdentityNumberKeyboardDelegate

extension Keyboard: IdentityNumberKeyboardDelegate {
    
    func keyboard(_ keyboard: IdentityNumberKeyboard, didEnter key: String) {
        delegate?.keyboard(self, didEnter: key)
        textField?.text?.append(key)
    }
    
    func keyboardDidTapBackspace(_ keyboard: IdentityNumberKeyboard) {
        delegate?.keyboardDidTapBackspace(self)
        textField?.text?.removeLast()
    }
}
