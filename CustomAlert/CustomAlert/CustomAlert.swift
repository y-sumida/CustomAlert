//
//  CustomAlertView.swift
//  CustomAlert
//
//  Created by Yuki Sumida on 2017/11/05.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//

import UIKit

class CustomAlert: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    private var actions:[CustomAlertAction] = []

    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }

    func loadNib(){
        Bundle.main.loadNibNamed("CustomAlert", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
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
            message.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
            return
        }

        actions.forEach { action in
            let button = CustomAlertButton(alertAction: action)
            stackView.addArrangedSubview(button)
        }
    }
}
