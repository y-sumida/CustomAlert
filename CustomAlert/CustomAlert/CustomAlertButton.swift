//
//  CustomAlertButton.swift
//  CustomAlert
//
//  Created by Yuki Sumida on 2017/11/19.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//

import UIKit

class CustomAlertButton: UIButton {
    private var action: (() -> Void) = {}

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(alertAction: CustomAlertAction) {
        super.init(frame: CGRect.zero)
        commonInit(alertAction: alertAction)
    }

    private func commonInit(alertAction: CustomAlertAction) {
        addTarget(self, action: #selector(CustomAlertButton.tapButton), for: .touchUpInside)

        if let handler = alertAction.handler {
            action = handler
        }

        layer.cornerRadius = 2
        setTitle(alertAction.title, for: .normal)
        backgroundColor = UIColor.lightGray

        switch alertAction.style {
        case .cancel:
            layer.borderColor = UIColor.white.cgColor
            layer.borderWidth = 2
        case .default:
            setTitleColor(UIColor.white, for: .normal)
        case .destructive:
            setTitleColor(UIColor.red, for: .normal)
        }
    }

    @objc func tapButton() {
        self.action()
    }
}

