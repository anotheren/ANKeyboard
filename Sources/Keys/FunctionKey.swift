//
//  FunctionKey.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2019/5/21.
//  Copyright © 2019 anotheren.com. All rights reserved.
//

import UIKit

final class FunctionKey: UIControl {
    
    private var animator = UIViewPropertyAnimator()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: Adaptor.phone(14, 15, 16), weight: .regular)
        view.textColor = .normalTextColor
        view.textAlignment = .center
        return view
    }()
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .highlightedKeyColor
        addTarget(self, action: #selector(touchDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(touchUp), for: [.touchUpInside, .touchDragExit, .touchCancel])
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.center.equalTo(snp.center)
        }
        layer.cornerRadius = 4
    }
    
    @objc private func touchDown() {
        animator.stopAnimation(true)
        backgroundColor = .normalKeyColor
    }
    
    @objc private func touchUp() {
        animator = UIViewPropertyAnimator(duration: 0.25, curve: .easeOut, animations: {
            self.backgroundColor = .highlightedKeyColor
        })
        animator.startAnimation()
    }
}
