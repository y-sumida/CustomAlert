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

    private let alertView: CustomAlert = CustomAlert()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(title: String, message: String, preferredStyle: UIAlertControllerStyle) {
        // TODO preferredStyle を使う
        alertTitle = title
        alertMessage = message
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
        alertView.title.text = alertTitle
        alertView.message.text = alertMessage
        alertView.cancelAction = { [unowned self] in self.dismiss(animated: true, completion: nil) }
        view.addSubview(alertView)

        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.centerYAnchor.constraint(equalTo: (alertView.superview?.centerYAnchor)!).isActive = true
        alertView.centerXAnchor.constraint(equalTo: (alertView.superview?.centerXAnchor)!).isActive = true
        alertView.widthAnchor.constraint(equalTo: (alertView.superview?.widthAnchor)!, multiplier: 0.80).isActive = true

        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
    }
}
