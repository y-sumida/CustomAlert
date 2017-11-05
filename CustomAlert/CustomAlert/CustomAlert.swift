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
}
