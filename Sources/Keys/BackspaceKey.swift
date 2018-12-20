//
//  BackSpaceKey.swift
//  ANKeyboard
//
//  Created by 刘栋 on 2018/12/20.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import UIKit
import SnapKit

class BackspaceKey: UIControl {
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .center
        let bundle = Bundle(for: BackspaceKey.self)
        let image = UIImage(named: "Backspace", in: bundle, compatibleWith: nil)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { maker in
            maker.center.equalTo(snp.center)
        }
    }
}
