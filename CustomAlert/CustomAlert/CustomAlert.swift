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
        // とりあえずボタン2つまで
        // TODO ボタンラベルのセット
        guard actions.count < 2 else { return }
        actions.append(action)
    }
}
