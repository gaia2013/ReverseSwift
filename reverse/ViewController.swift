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
        
        // PopButtonを生成
        let myButton = UIButton()
        myButton.frame = CGRect(x:0, y:0, width:200, height:40)
        myButton.backgroundColor = UIColor.red
        myButton.layer.masksToBounds = true
        myButton.setTitle("PopOver", for: UIControlState.normal)
        myButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        myButton.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y:200)
        myButton.tag = 0
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: .touchUpInside)

        // viewにButtonを追加
        self.view.addSubview(myButton)
    }
    
    // Buttonが押された時に呼ばれるメソッド
    @objc func onClickMyButton(sender : UIButton){
        
        // SecondViewControllerのインスタンスを生成
        let second = SecondViewController()
        
        // navigationControllerのrootViewControllerにSecondViewControllerをセット
        let nav = UINavigationController(rootViewController: second)
        
        // 画面遷移
        self.present(nav, animated: true, completion: nil)
    }
}

