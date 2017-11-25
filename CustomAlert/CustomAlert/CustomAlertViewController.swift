//
//  CustomAlertViewController.swift
//  CustomAlert
//
//  Created by Yuki Sumida on 2017/11/05.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//

import UIKit

struct CustomAlertAction {
    var title: String?
    var style: UIAlertActionStyle
    var handler: (() -> Void)?
}

class CustomAlertViewController: UIViewController {
    private let screenSize: CGRect = UIScreen.main.bounds
    private let alertView: CustomAlert = CustomAlert()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(title: String?, message: String?, preferredStyle: UIAlertControllerStyle) {
        super.init(nibName: nil, bundle: nil)
        alertView.title = title
        alertView.message = message
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
        view.addSubview(alertView)

        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.centerYAnchor.constraint(equalTo: (alertView.superview?.centerYAnchor)!).isActive = true
        alertView.centerXAnchor.constraint(equalTo: (alertView.superview?.centerXAnchor)!).isActive = true
        alertView.widthAnchor.constraint(equalTo: (alertView.superview?.widthAnchor)!, multiplier: 0.80).isActive = true

        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
    }

    func addAction(_ action: CustomAlertAction) {
        let action = CustomAlertAction(title: action.title, style: action.style, handler: { [unowned self] in self.dismiss(animated: true, completion: action.handler) })
        alertView.addAction(action)
    }
}
