//
//  CustomAlertViewProtocol.swift
//  CustomAlert
//
//  Created by Yuki Sumida on 2017/11/30.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//
import UIKit

protocol AlertViewProtocol {
    var alertTitle: UILabel { get }
    var alertMessage: UILabel { get }
    var stackView: UIStackView { get }
    associatedtype T: AlertButtonProtocol
    init(frame: CGRect)
    init(title: String?, message: String?, actions: [CustomAlertAction])
    func setupViews(actions: [CustomAlertAction])
    func setupButtons(actions: [CustomAlertAction]) -> [T]
}

extension AlertViewProtocol where Self: UIView {
    init(title: String?, message: String?, actions: [CustomAlertAction]) {
        self.init(frame: CGRect.zero)
        
        setupViews(actions: actions)
        alertTitle.text = title
        alertMessage.text = message
        
        let buttons = setupButtons(actions: actions)
        buttons.forEach { button in
            stackView.addArrangedSubview(button as! UIView)
        }
    }
    
    func setupViews(actions: [CustomAlertAction]) {
        backgroundColor = UIColor.white
        
        alertTitle.translatesAutoresizingMaskIntoConstraints = false
        alertTitle.font = UIFont.systemFont(ofSize: 21, weight: .medium)
        alertTitle.numberOfLines = 0
        alertTitle.textAlignment = .left
        self.addSubview(alertTitle)
        alertTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 24).isActive = true
        alertTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
        alertTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24).isActive = true
        
        alertMessage.translatesAutoresizingMaskIntoConstraints = false
        alertMessage.font = UIFont.systemFont(ofSize: 17)
        alertMessage.numberOfLines = 0
        alertMessage.textAlignment = .left
        self.addSubview(alertMessage)
        alertMessage.topAnchor.constraint(equalTo: alertTitle.bottomAnchor, constant: 20).isActive = true
        alertMessage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
        alertMessage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24).isActive = true
        
        if actions.count == 0 {
            stackView.removeFromSuperview()
            alertMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
            return
        } else {
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
        
        if actions.count > 2 {
            stackView.axis = .vertical
            stackView.spacing = 0.5
        }
    }
    
    func setupButtons(actions: [CustomAlertAction]) -> [T] {
        var copyActions = actions
        if copyActions.count > 2 {
            // 縦に並ぶときは一番下がキャンセル
            if let cancel = copyActions.filter({ $0.style == .cancel }).first {
                copyActions = actions.dropFirst().map { $0 }
                copyActions.append(cancel)
            }
        }
        
        var buttons: [T] = []
        copyActions.forEach { action in
            let button: Self.T = Self.T.init(alertAction: action)
            buttons.append(button)
        }
        return buttons
    }
}
