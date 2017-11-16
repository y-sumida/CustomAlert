//
//  CustomAlertViewController.swift
//  CustomAlert
//
//  Created by Yuki Sumida on 2017/11/05.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {
    private let screenSize: CGRect = UIScreen.main.bounds

    private let alertTitle: String!
    private let alertMessage: String!
    private var alertHandler: (() -> Void)? = nil

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(title: String, message: String, action: (() -> Void)? = nil) {
        alertTitle = title
        alertMessage = message
        if let action = action {
            alertHandler = action
        }
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve

        self.initAlertView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func initAlertView() {
        let alert = CustomAlert()
        alert.title.text = alertTitle
        alert.message.text = alertMessage
        if let handler = alertHandler {
            alert.leftAction = { [unowned self] in self.dismiss(animated: true, completion: handler) }
        } else {
            alert.leftAction = { [unowned self] in self.dismiss(animated: true, completion: nil) }
        }
        view.addSubview(alert)
        alert.translatesAutoresizingMaskIntoConstraints = false
        alert.centerYAnchor.constraint(equalTo: (alert.superview?.centerYAnchor)!).isActive = true
        alert.centerXAnchor.constraint(equalTo: (alert.superview?.centerXAnchor)!).isActive = true
        alert.widthAnchor.constraint(equalTo: (alert.superview?.widthAnchor)!, multiplier: 0.80).isActive = true

        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
    }
}
