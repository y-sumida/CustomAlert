//
//  CustomAlertView.swift
//  CustomAlert
//
//  Created by Yuki Sumida on 2017/11/05.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//

import UIKit

class CustomAlert: UIView {
    private let alertTitle = UILabel()
    private let alertMessage = UILabel()
    private let stackView = UIStackView()
    private var actions:[CustomAlertAction] = []

    var title: String? = nil {
        didSet {
            if let text = title {
                alertTitle.text = text
            }
        }
    }
    var message: String? = nil {
        didSet {
            if let text = message {
                alertMessage.text = text
            }
        }
    }

    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
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

    func addAction(_ action: CustomAlertAction) {
        // キャンセルは1つのみ、全体で2つまで
        if action.style == .cancel {
            // キャンセルは必ず0番目 = 左に置く
            actions = actions.filter { $0.style != .cancel }
            actions.insert(action, at: 0)
        } else if actions.count < 2 {
            actions.append(action)
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupButtons()
    }

    private func setupButtons() {
        if actions.isEmpty {
            stackView.removeFromSuperview()
            alertMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
            return
        }

        actions.forEach { action in
            let button = CustomAlertButton(alertAction: action)
            stackView.addArrangedSubview(button)
        }
    }
}
