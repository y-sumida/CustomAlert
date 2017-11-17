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
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var defaultButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stackViewHeight: NSLayoutConstraint!
    private var actions:[CustomAlertAction] = []

    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }

    @IBAction func tapDefault(_ sender: Any) {
        guard actions.count == 2, let handler = actions[1].handler else { return }
        handler()
    }

    @IBAction func tapCancel(_ sender: Any) {
        guard !actions.isEmpty, let handler = actions[0].handler  else { return }
        handler()
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
        switch actions.count {
        case 0:
            cancelButton.isHidden = true
            defaultButton.isHidden = true
            stackView.isHidden = true
            stackViewHeight.constant = 0.0
        case 1:
            defaultButton.isHidden = true
        default:
            cancelButton.isHidden = false
            defaultButton.isHidden = false
        }
    }
}
