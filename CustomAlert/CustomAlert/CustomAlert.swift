//
//  CustomAlertView.swift
//  CustomAlert
//
//  Created by Yuki Sumida on 2017/11/05.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//

import UIKit

protocol AlertViewProtocol {
    associatedtype T: AlertButtonProtocol = CustomAlertButton
    func button(action: CustomAlertAction) -> T
}

class CustomAlert: UIView {
    private let alertTitle = UILabel()
    private let alertMessage = UILabel()
    private let stackView = UIStackView()

    required init(title: String?, message: String?, actions: [CustomAlertAction]) {
        super.init(frame: CGRect.zero)
        alertTitle.text = title
        alertMessage.text = message
        commonInit()
        setupButtons(actions: actions)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        backgroundColor = UIColor.white

        alertTitle.translatesAutoresizingMaskIntoConstraints = false
        alertTitle.text = "title"
        alertTitle.font = UIFont.systemFont(ofSize: 21, weight: .medium)
        alertTitle.numberOfLines = 0
        alertTitle.textAlignment = .left
        self.addSubview(alertTitle)
        alertTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 24).isActive = true
        alertTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
        alertTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24).isActive = true

        alertMessage.translatesAutoresizingMaskIntoConstraints = false
        alertMessage.text = "message"
        alertMessage.font = UIFont.systemFont(ofSize: 17)
        alertMessage.numberOfLines = 0
        alertMessage.textAlignment = .left
        self.addSubview(alertMessage)
        alertMessage.topAnchor.constraint(equalTo: alertTitle.bottomAnchor, constant: 20).isActive = true
        alertMessage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
        alertMessage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24).isActive = true

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        self.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: alertMessage.bottomAnchor, constant: 32).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
    }

    private func setupButtons(actions: [CustomAlertAction]) {
        if actions.isEmpty {
            stackView.removeFromSuperview()
            alertMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
            return
        }
        var copyActions = actions

        if copyActions.count > 2 {
            stackView.axis = .vertical
            stackView.spacing = 0.5
            // 縦に並ぶときは一番下がキャンセル
            if let cancel = copyActions.filter({ $0.style == .cancel }).first {
                copyActions = actions.dropFirst().map { $0 }
                copyActions.append(cancel)
            }
        }

        copyActions.forEach { action in
            let button = self.button(action: action)
            stackView.addArrangedSubview(button)
        }
    }
}

extension CustomAlert: AlertViewProtocol {
    typealias T = CustomAlertButton
    func button(action: CustomAlertAction) -> T {
       return CustomAlertButton(alertAction: action)
    }
}
