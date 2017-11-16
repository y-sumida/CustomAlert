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

    var cancelAction: (() -> Void) = {}

    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }

    @IBAction func tapCancel(_ sender: Any) {
        self.cancelAction()
    }

    func loadNib(){
        Bundle.main.loadNibNamed("CustomAlert", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
    }
}
