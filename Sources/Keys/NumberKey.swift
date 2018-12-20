//
//  NumberKey.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2018/12/14.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import UIKit
import SnapKit

final class NumberKey: UIControl {
    
    private var animator = UIViewPropertyAnimator()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        view.textColor = UIColor.black
        view.textAlignment = .center
        return view
    }()
    
    public var title: String? {
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
        backgroundColor = .normalColor
        addTarget(self, action: #selector(touchDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(touchUp), for: [.touchUpInside, .touchDragExit, .touchCancel])
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.center.equalTo(snp.center)
        }
        layer.cornerRadius = 5
        layer.applySketchShadow(color: UIColor.black, alpha: 0.35, x: 0, y: 1, blur: 0, spread: 0)
    }
    
    @objc private func touchDown() {
        animator.stopAnimation(true)
        backgroundColor = .highlightedColor
    }
    
    @objc private func touchUp() {
        animator = UIViewPropertyAnimator(duration: 0.25, curve: .easeOut, animations: {
            self.backgroundColor = .normalColor
        })
        animator.startAnimation()
    }
}
