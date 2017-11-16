//
//  ViewController.swift
//  CustomAlert
//
//  Created by Yuki Sumida on 2017/11/05.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapButton(_ sender: Any) {
        let vc = CustomAlertViewController(title: "タイトルタイトル", message: "メッセージメッセージメッセージ", preferredStyle: .alert)
        let defaultAction = CustomAlertAction(title: "OK", style: .default, handler: { () -> Void in print("ok action")})
        let cancelAction = CustomAlertAction(title: "閉じる", style: .cancel, handler: { () -> Void in print("cancel action")})
        vc.addAction(defaultAction)
        vc.addAction(cancelAction)
        self.present(vc, animated: true, completion: nil)
    }
    
}

