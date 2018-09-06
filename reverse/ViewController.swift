//
//  ViewController.swift
//  reverse
//
//  Created by 山口仁志 on 2018/08/12.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        // Buttonを作る
        let myButton = UIButton(frame: CGRect(x:0, y:0, width: 200, height:50))
        myButton.layer.position = self.view.center
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.backgroundColor = UIColor.orange
        myButton.setTitle("Present!", for: UIControlState.normal)
        myButton.addTarget(self, action: #selector(ViewController.onMyButtonClick(sender:)), for: UIControlEvents.touchUpInside)
        
        // viewにButtonを追加
        self.view.addSubview(myButton)
        
    }
    
    // ボタンがタップされた時に呼び出されるメソッド
    @objc func onMyButtonClick(sender : UIButton) {
        
        // コンテンツのViewControllerを生成
        let popover = UIViewController()
        
        // コンテンツViewControllerのサイズを指定
        popover.preferredContentSize = CGSize(width: 200, height: 200)
        
        // コンテンツViewControllerの背景を青色に設定
        popover.view.backgroundColor = UIColor.blue
        popover.modalPresentationStyle = .popover
        
        if let presentationController = popover.popoverPresentationController {
            presentationController.permittedArrowDirections = .any
            presentationController.sourceView = sender
            presentationController.sourceRect = sender.bounds
        }
        
        present(popover, animated: true, completion: nil)
    }

}

