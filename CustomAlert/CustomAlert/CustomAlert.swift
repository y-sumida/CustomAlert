//
//  CustomAlertView.swift
//  CustomAlert
//
//  Created by Yuki Sumida on 2017/11/05.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//

import UIKit

class CustomAlert: UIView {
    let alertTitle = UILabel()
    let alertMessage = UILabel()
    let stackView = UIStackView()

    override required init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomAlert: AlertViewProtocol {
    typealias T = CustomAlertButton
}
