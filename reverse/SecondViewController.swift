//
//  SecondViewController.swift
//  reverse
//
//  Created by 山口仁志 on 2018/09/08.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.black
        
        // 戻るButtonを生成
        let myButton = UIButton()
        myButton.frame = CGRect(x:0, y:0, width:200, height:40)
        myButton.backgroundColor = UIColor.red
        myButton.layer.masksToBounds = true
        myButton.setTitle("戻る", for: UIControlState.normal)
        myButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        myButton.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y:200)
        myButton.tag = 1
        myButton.addTarget(self, action: #selector(SecondViewController.onClickMyButton(sender:)), for: .touchUpInside)
        
        // viewにButtonを追加
        self.view.addSubview(myButton)
    }
    
    // Buttonを押した時に呼ばれるメソッド
    @objc func onClickMyButton(sender: UIButton){
        
        // Viewを閉じる
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}
