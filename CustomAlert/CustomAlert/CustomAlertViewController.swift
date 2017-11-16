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
    private var alertHandler: (() -> Void)? = nil

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(title: String, action: (() -> Void)? = nil) {
        alertTitle = title
        if let action = action {
            alertHandler = action
        }
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let alert = CustomAlert(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        alert.title.text = alertTitle
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
